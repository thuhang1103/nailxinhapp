import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import '../../core/helper.dart';

import '../../core/appException.dart';
//entity
import '../../domain/entities/address/address.dart';
import '../../domain/entities/address/provinces.dart';
import '../../domain/entities/address/districts.dart';
import '../../domain/entities/address/ward.dart';

//model
import '../models/address/province_model.dart';
import '../models/address/district_model.dart';
import '../models/address/ward_model.dart';
import '../models/address/address_model.dart';

abstract class AddressData {
  Future<List<Provinces>> getProvinces();
  Future<List<Districts>> getDistricts(int provinceCode);
  Future<List<Ward>> getWards(int districtCode);
  Future<List<Address>> getAddress();
  Future<Address> getAddressDefault();

  //update
  Future<void> updateAddress(
    int addressId,
    int ProvinceCode,
    int DistrictCode,
    int WardCode,
    String RecipientName,
    String Phone,
    String Province,
    String District,
    String Ward,
    String StreetAddress,
  );
  //add
  Future<void> addAddress(
    int ProvinceCode,
    int DistrictCode,
    int WardCode,
    String RecipientName,
    String Phone,
    String Province,
    String District,
    String Ward,
    String StreetAddress,
  );
  //delete
  Future<void> deleteAddress(int addressId);
}

class AddressDataImpl implements AddressData {
  final Dio dio;

  final String baseUrl;
  AddressDataImpl(
    this.dio, {
    this.baseUrl = 'https://provinces.open-api.vn/api',
  });

  @override
  Future<List<Provinces>> getProvinces() async {
    final res = await dio.get('$baseUrl/v1/?depth=1');
    final List data = res.data as List;
    return data.map((e) => ProvinceModel.fromJson(e).toEntity()).toList();
  }

  @override
  Future<List<Districts>> getDistricts(int provinceCode) async {
    final res = await dio.get(
      '$baseUrl/p/$provinceCode',
      queryParameters: {'depth': 2},
    );
    final List data = res.data['districts'] as List;

    return data.map((e) => DistrictModel.fromJson(e).toEntity()).toList();
  }

  @override
  Future<List<Ward>> getWards(int districtCode) async {
    final res = await dio.get(
      '$baseUrl/d/$districtCode',
      queryParameters: {'depth': 2},
    );

    final List data = res.data['wards'] as List;

    return data.map((e) => WardModel.fromJson(e).toEntity()).toList();
  }

  @override
  Future<List<Address>> getAddress() async {
    try {
      final res = await dio.get('/addresses/all');
      final status = res.statusCode ?? 0;
      if (status < 200 || status >= 300) throw ServerException();

      dynamic data = res.data as List;
      if (data is String) data = jsonDecode(data);
      if (data is! List) throw ParseException();
      print('List Address trgm data: $data');

      return data.map((e) => AddressModel.fromJson(e).toEntity()).toList();
    } on DioException catch (e) {
      throw mapDioExceptionToAppException(e);
    } on FormatException {
      throw const ParseException();
    } catch (e) {
      throw BusinessException();
    }
  }

  @override
  Future<Address> getAddressDefault() async {
    try {
      final res = await dio.get('/addresses/default');
      final status = res.statusCode ?? 0;
      if (status < 200 || status >= 300) throw ServerException();

      dynamic data = res.data;
      if (data is String) data = jsonDecode(data);
      if (data is! Map<String, dynamic>) throw ParseException();

      final model = AddressModel.fromJson(data);
      return model.toEntity();
    } on DioException catch (e) {
      throw mapDioExceptionToAppException(e);
    } on FormatException {
      throw const ParseException();
    } catch (e) {
      throw BusinessException(e.toString());
    }
  }

  @override
  Future<void> addAddress(
    int ProvinceCode,
    int DistrictCode,
    int WardCode,
    String RecipientName,
    String Phone,
    String Province,
    String District,
    String Ward,
    String StreetAddress,
  ) async {
    try {
      final payload = {
        'ProvinceCode': ProvinceCode,
        'DistrictCode': DistrictCode,
        'WardCode': WardCode,
        'RecipientName': RecipientName,
        'Phone': Phone,
        'Province': Province,
        'District': District,
        'Ward': Ward,
        'StreetAddress': StreetAddress,
      };
      final res = await dio.post('/addresses/add', data: payload);
      final status = res.statusCode ?? 0;
      if (status < 200 || status >= 300) throw ServerException();
      return;
    } on DioException catch (e) {
      throw mapDioExceptionToAppException(e);
    } catch (e) {
      throw BusinessException(e.toString());
    }
  }

  @override
  Future<void> updateAddress(
    int addressId,
    int ProvinceCode,
    int DistrictCode,
    int WardCode,
    String RecipientName,
    String Phone,
    String Province,
    String District,
    String Ward,
    String StreetAddress,
  ) async {
    try {
      final body = {
        'addressId': addressId,
        'ProvinceCode': ProvinceCode,
        'DistrictCode': DistrictCode,
        'WardCode': WardCode,
        'RecipientName': RecipientName,
        'Phone': Phone,
        'Province': Province,
        'District': District,
        'Ward': Ward,
        'StreetAddress': StreetAddress,
      };
      final res = await dio.put('/addresses/update', data: body);
      final status = res.statusCode ?? 0;
      if (status < 200 || status >= 300) throw ServerException();
      return;
    } on DioException catch (e) {
      throw mapDioExceptionToAppException(e);
    } catch (e) {
      throw BusinessException(e.toString());
    }
  }

  @override
  Future<void> deleteAddress(int addressId) async {
    try {
      final res = await dio.delete(
        '/addresses/delete',
        data: {'addressId': addressId},
      );
      final status = res.statusCode ?? 0;
      if (status < 200 || status >= 300) throw ServerException();
      return;
    } on DioException catch (e) {
      throw mapDioExceptionToAppException(e);
    } catch (e) {
      throw BusinessException(e.toString());
    }
  }
}
