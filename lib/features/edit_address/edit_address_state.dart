//freezed
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../core/common_state.dart';
import '../../domain/entities/address/address.dart';
import '../../domain/entities/address/provinces.dart';

import '../../domain/entities/address/districts.dart';
import '../../domain/entities/address/ward.dart';

part 'edit_address_state.freezed.dart';

@freezed
class EditAddressState with _$EditAddressState {
  const factory EditAddressState({
    final List<Address>? addresses,
    final Address? addressDefault,
    final List<Provinces>? provinces,
    final List<Districts>? districts,
    final List<Ward>? wards,

    @Default(0) int provinceCode,
    @Default(0) int districtCode,
    @Default(0) int wardCode,
    @Default('') String recipientName,
    @Default('') String phone,
    @Default('') String province,
    @Default('') String district,
    @Default('') String ward,
    @Default('') String streetAddress,

    @Default(CommonState.initial()) CommonState getAddressState,
    @Default(CommonState.initial()) CommonState updateAddressState,
  }) = _EditAddressState;
}
