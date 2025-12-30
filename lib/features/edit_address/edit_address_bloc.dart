import 'package:bloc/bloc.dart';

import '../../core/common_state.dart';
import '../../../core/appException.dart';
import 'dart:async';
//helper

import '../../core/helper.dart';
import './edit_address_event.dart';
import './edit_address_state.dart';
import '../../domain/usecases/address_usecase.dart';

class EditAddressBloc extends Bloc<EditAddressEvent, EditAddressState> {
  final AddressUseCase addressUseCase;
  final _uiEventsCtrl = StreamController<String>.broadcast();
  Stream<String> get uiEvents => _uiEventsCtrl.stream;

  EditAddressBloc({required this.addressUseCase})
    : super(const EditAddressState()) {
    // register handlers
    on<GetAddressEvent>(_onGetAddress);
    on<UpdateAddressEvent>(_onUpdateAddress);
    on<DeleteAddressEvent>(_onDeleteAddress);
    on<AddAddressEvent>(_onAddAddress);

    on<GetProvinceEvent>(_onGetProvince);
    on<GetDistrictEvent>(_onGetDistrict);
    on<GetWardEvent>(_onGetWard);

    on<SelectProvinceEvent>(_onSelectProvince);
    on<SelectDistrictEvent>(_onSelectDistrict);
    on<SelectWardEvent>(_onSelectWard);
    on<StreetChanged>(_onStreetChanged);
    on<RecipientNameChanged>(_onRecipientNameChanged);
    on<PhoneChanged>(_onPhoneChanged);
  }
  @override
  Future<void> close() {
    _uiEventsCtrl.close();
    return super.close();
  }

  Future<void> _onGetAddress(
    GetAddressEvent event,
    Emitter<EditAddressState> emit,
  ) async {
    emit(state.copyWith(getAddressState: const CommonState.loading()));

    try {
      final listAddress = await addressUseCase.getAddress();
      final addressDefault = await addressUseCase.getAddressDefault();
      print('Address Default: $addressDefault');
      print('List Address: $listAddress');

      emit(
        state.copyWith(
          addresses: listAddress,
          addressDefault: addressDefault,
          getAddressState: const CommonState.success(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          getAddressState: CommonState.error(BusinessException(e.toString())),
        ),
      );
    }
  }

  Future<void> _onGetProvince(
    GetProvinceEvent event,
    Emitter<EditAddressState> emit,
  ) async {
    try {
      final provinces = await addressUseCase.getProvinces();
      emit(state.copyWith(provinces: provinces));
    } catch (e) {
      print('Error in _onChangeIsSelected: $e');
      _uiEventsCtrl.add('Lỗi server $e');
    }
  }

  Future<void> _onGetDistrict(
    GetDistrictEvent event,
    Emitter<EditAddressState> emit,
  ) async {
    try {
      final districts = await addressUseCase.getDistricts(event.provinceCode);
      emit(state.copyWith(districts: districts));
    } catch (e) {
      print('Error in _onChangeIsSelected: $e');
      _uiEventsCtrl.add('Lỗi server $e');
    }
  }

  Future<void> _onGetWard(
    GetWardEvent event,
    Emitter<EditAddressState> emit,
  ) async {
    try {
      final wards = await addressUseCase.getWards(event.districtCode);
      emit(state.copyWith(wards: wards));
    } catch (e) {
      print('Error in _onChangeIsSelected: $e');
      _uiEventsCtrl.add('Lỗi server $e');
    }
  }

  Future<void> _onUpdateAddress(
    UpdateAddressEvent event,
    Emitter<EditAddressState> emit,
  ) async {
    emit(state.copyWith(updateAddressState: const CommonState.loading()));

    try {
      await addressUseCase.updateAddress(
        event.addressId,
        state.provinceCode ?? 0,
        state.districtCode ?? 0,
        state.wardCode ?? 0,
        state.recipientName,
        state.phone,
        state.province,
        state.district,
        state.ward,
        state.streetAddress,
      );
      emit(state.copyWith(updateAddressState: const CommonState.success()));
    } catch (e) {
      emit(
        state.copyWith(
          updateAddressState: CommonState.error(
            BusinessException(e.toString()),
          ),
        ),
      );
    }
  }

  Future<void> _onDeleteAddress(
    DeleteAddressEvent event,
    Emitter<EditAddressState> emit,
  ) async {
    emit(state.copyWith(updateAddressState: const CommonState.loading()));

    try {
      await addressUseCase.deleteAddress(event.addressId);
      final listAddress = await addressUseCase.getAddress();

      final address = await addressUseCase.getAddressDefault();

      emit(state.copyWith(addressDefault: address, addresses: listAddress));
      _uiEventsCtrl.add('Đã xoá địa chỉ thành công ');
    } catch (e) {
      print('Error in _onChangeIsSelected: $e');
      _uiEventsCtrl.add('Lỗi server $e');
    }
  }

  Future<void> _onAddAddress(
    AddAddressEvent event,
    Emitter<EditAddressState> emit,
  ) async {
    emit(state.copyWith(updateAddressState: const CommonState.loading()));

    try {
      await addressUseCase.addAddress(
        state.provinceCode ?? 0,
        state.districtCode ?? 0,
        state.wardCode ?? 0,
        state.recipientName,
        state.phone,
        state.province,
        state.district,
        state.ward,
        state.streetAddress,
      );
      final addressDefault = await addressUseCase.getAddressDefault();
      final listAddress = await addressUseCase.getAddress();
      emit(
        state.copyWith(addressDefault: addressDefault, addresses: listAddress),
      );
    } catch (e) {
      print('Error in _onChangeIsSelected: $e');
      _uiEventsCtrl.add('Lỗi server $e');
    }
  }

  Future<void> _onStreetChanged(
    StreetChanged event,
    Emitter<EditAddressState> emit,
  ) async {
    emit(state.copyWith(streetAddress: event.street));
  }

  Future<void> _onRecipientNameChanged(
    RecipientNameChanged event,
    Emitter<EditAddressState> emit,
  ) async {
    emit(state.copyWith(recipientName: event.recipientName));
  }

  Future<void> _onPhoneChanged(
    PhoneChanged event,
    Emitter<EditAddressState> emit,
  ) async {
    emit(state.copyWith(phone: event.recipientPhone));
  }

  Future<void> _onSelectProvince(
    SelectProvinceEvent event,
    Emitter<EditAddressState> emit,
  ) async {
    emit(
      state.copyWith(
        provinceCode: event.provinceCode,
        province: event.provinceName,
      ),
    );
  }

  Future<void> _onSelectDistrict(
    SelectDistrictEvent event,
    Emitter<EditAddressState> emit,
  ) async {
    emit(
      state.copyWith(
        districtCode: event.districtCode,
        district: event.districtName,
      ),
    );
  }

  Future<void> _onSelectWard(
    SelectWardEvent event,
    Emitter<EditAddressState> emit,
  ) async {
    emit(state.copyWith(wardCode: event.wardCode, ward: event.wardName));
  }
}
