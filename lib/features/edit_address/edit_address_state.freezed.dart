// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_address_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$EditAddressState {
  List<Address>? get addresses => throw _privateConstructorUsedError;
  Address? get addressDefault => throw _privateConstructorUsedError;
  List<Provinces>? get provinces => throw _privateConstructorUsedError;
  List<Districts>? get districts => throw _privateConstructorUsedError;
  List<Ward>? get wards => throw _privateConstructorUsedError;
  int get provinceCode => throw _privateConstructorUsedError;
  int get districtCode => throw _privateConstructorUsedError;
  int get wardCode => throw _privateConstructorUsedError;
  String get recipientName => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get province => throw _privateConstructorUsedError;
  String get district => throw _privateConstructorUsedError;
  String get ward => throw _privateConstructorUsedError;
  String get streetAddress => throw _privateConstructorUsedError;
  CommonState get getAddressState => throw _privateConstructorUsedError;
  CommonState get updateAddressState => throw _privateConstructorUsedError;

  /// Create a copy of EditAddressState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EditAddressStateCopyWith<EditAddressState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditAddressStateCopyWith<$Res> {
  factory $EditAddressStateCopyWith(
    EditAddressState value,
    $Res Function(EditAddressState) then,
  ) = _$EditAddressStateCopyWithImpl<$Res, EditAddressState>;
  @useResult
  $Res call({
    List<Address>? addresses,
    Address? addressDefault,
    List<Provinces>? provinces,
    List<Districts>? districts,
    List<Ward>? wards,
    int provinceCode,
    int districtCode,
    int wardCode,
    String recipientName,
    String phone,
    String province,
    String district,
    String ward,
    String streetAddress,
    CommonState getAddressState,
    CommonState updateAddressState,
  });

  $AddressCopyWith<$Res>? get addressDefault;
  $CommonStateCopyWith<$Res> get getAddressState;
  $CommonStateCopyWith<$Res> get updateAddressState;
}

/// @nodoc
class _$EditAddressStateCopyWithImpl<$Res, $Val extends EditAddressState>
    implements $EditAddressStateCopyWith<$Res> {
  _$EditAddressStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EditAddressState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addresses = freezed,
    Object? addressDefault = freezed,
    Object? provinces = freezed,
    Object? districts = freezed,
    Object? wards = freezed,
    Object? provinceCode = null,
    Object? districtCode = null,
    Object? wardCode = null,
    Object? recipientName = null,
    Object? phone = null,
    Object? province = null,
    Object? district = null,
    Object? ward = null,
    Object? streetAddress = null,
    Object? getAddressState = null,
    Object? updateAddressState = null,
  }) {
    return _then(
      _value.copyWith(
            addresses: freezed == addresses
                ? _value.addresses
                : addresses // ignore: cast_nullable_to_non_nullable
                      as List<Address>?,
            addressDefault: freezed == addressDefault
                ? _value.addressDefault
                : addressDefault // ignore: cast_nullable_to_non_nullable
                      as Address?,
            provinces: freezed == provinces
                ? _value.provinces
                : provinces // ignore: cast_nullable_to_non_nullable
                      as List<Provinces>?,
            districts: freezed == districts
                ? _value.districts
                : districts // ignore: cast_nullable_to_non_nullable
                      as List<Districts>?,
            wards: freezed == wards
                ? _value.wards
                : wards // ignore: cast_nullable_to_non_nullable
                      as List<Ward>?,
            provinceCode: null == provinceCode
                ? _value.provinceCode
                : provinceCode // ignore: cast_nullable_to_non_nullable
                      as int,
            districtCode: null == districtCode
                ? _value.districtCode
                : districtCode // ignore: cast_nullable_to_non_nullable
                      as int,
            wardCode: null == wardCode
                ? _value.wardCode
                : wardCode // ignore: cast_nullable_to_non_nullable
                      as int,
            recipientName: null == recipientName
                ? _value.recipientName
                : recipientName // ignore: cast_nullable_to_non_nullable
                      as String,
            phone: null == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String,
            province: null == province
                ? _value.province
                : province // ignore: cast_nullable_to_non_nullable
                      as String,
            district: null == district
                ? _value.district
                : district // ignore: cast_nullable_to_non_nullable
                      as String,
            ward: null == ward
                ? _value.ward
                : ward // ignore: cast_nullable_to_non_nullable
                      as String,
            streetAddress: null == streetAddress
                ? _value.streetAddress
                : streetAddress // ignore: cast_nullable_to_non_nullable
                      as String,
            getAddressState: null == getAddressState
                ? _value.getAddressState
                : getAddressState // ignore: cast_nullable_to_non_nullable
                      as CommonState,
            updateAddressState: null == updateAddressState
                ? _value.updateAddressState
                : updateAddressState // ignore: cast_nullable_to_non_nullable
                      as CommonState,
          )
          as $Val,
    );
  }

  /// Create a copy of EditAddressState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res>? get addressDefault {
    if (_value.addressDefault == null) {
      return null;
    }

    return $AddressCopyWith<$Res>(_value.addressDefault!, (value) {
      return _then(_value.copyWith(addressDefault: value) as $Val);
    });
  }

  /// Create a copy of EditAddressState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommonStateCopyWith<$Res> get getAddressState {
    return $CommonStateCopyWith<$Res>(_value.getAddressState, (value) {
      return _then(_value.copyWith(getAddressState: value) as $Val);
    });
  }

  /// Create a copy of EditAddressState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommonStateCopyWith<$Res> get updateAddressState {
    return $CommonStateCopyWith<$Res>(_value.updateAddressState, (value) {
      return _then(_value.copyWith(updateAddressState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EditAddressStateImplCopyWith<$Res>
    implements $EditAddressStateCopyWith<$Res> {
  factory _$$EditAddressStateImplCopyWith(
    _$EditAddressStateImpl value,
    $Res Function(_$EditAddressStateImpl) then,
  ) = __$$EditAddressStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<Address>? addresses,
    Address? addressDefault,
    List<Provinces>? provinces,
    List<Districts>? districts,
    List<Ward>? wards,
    int provinceCode,
    int districtCode,
    int wardCode,
    String recipientName,
    String phone,
    String province,
    String district,
    String ward,
    String streetAddress,
    CommonState getAddressState,
    CommonState updateAddressState,
  });

  @override
  $AddressCopyWith<$Res>? get addressDefault;
  @override
  $CommonStateCopyWith<$Res> get getAddressState;
  @override
  $CommonStateCopyWith<$Res> get updateAddressState;
}

/// @nodoc
class __$$EditAddressStateImplCopyWithImpl<$Res>
    extends _$EditAddressStateCopyWithImpl<$Res, _$EditAddressStateImpl>
    implements _$$EditAddressStateImplCopyWith<$Res> {
  __$$EditAddressStateImplCopyWithImpl(
    _$EditAddressStateImpl _value,
    $Res Function(_$EditAddressStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EditAddressState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addresses = freezed,
    Object? addressDefault = freezed,
    Object? provinces = freezed,
    Object? districts = freezed,
    Object? wards = freezed,
    Object? provinceCode = null,
    Object? districtCode = null,
    Object? wardCode = null,
    Object? recipientName = null,
    Object? phone = null,
    Object? province = null,
    Object? district = null,
    Object? ward = null,
    Object? streetAddress = null,
    Object? getAddressState = null,
    Object? updateAddressState = null,
  }) {
    return _then(
      _$EditAddressStateImpl(
        addresses: freezed == addresses
            ? _value._addresses
            : addresses // ignore: cast_nullable_to_non_nullable
                  as List<Address>?,
        addressDefault: freezed == addressDefault
            ? _value.addressDefault
            : addressDefault // ignore: cast_nullable_to_non_nullable
                  as Address?,
        provinces: freezed == provinces
            ? _value._provinces
            : provinces // ignore: cast_nullable_to_non_nullable
                  as List<Provinces>?,
        districts: freezed == districts
            ? _value._districts
            : districts // ignore: cast_nullable_to_non_nullable
                  as List<Districts>?,
        wards: freezed == wards
            ? _value._wards
            : wards // ignore: cast_nullable_to_non_nullable
                  as List<Ward>?,
        provinceCode: null == provinceCode
            ? _value.provinceCode
            : provinceCode // ignore: cast_nullable_to_non_nullable
                  as int,
        districtCode: null == districtCode
            ? _value.districtCode
            : districtCode // ignore: cast_nullable_to_non_nullable
                  as int,
        wardCode: null == wardCode
            ? _value.wardCode
            : wardCode // ignore: cast_nullable_to_non_nullable
                  as int,
        recipientName: null == recipientName
            ? _value.recipientName
            : recipientName // ignore: cast_nullable_to_non_nullable
                  as String,
        phone: null == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String,
        province: null == province
            ? _value.province
            : province // ignore: cast_nullable_to_non_nullable
                  as String,
        district: null == district
            ? _value.district
            : district // ignore: cast_nullable_to_non_nullable
                  as String,
        ward: null == ward
            ? _value.ward
            : ward // ignore: cast_nullable_to_non_nullable
                  as String,
        streetAddress: null == streetAddress
            ? _value.streetAddress
            : streetAddress // ignore: cast_nullable_to_non_nullable
                  as String,
        getAddressState: null == getAddressState
            ? _value.getAddressState
            : getAddressState // ignore: cast_nullable_to_non_nullable
                  as CommonState,
        updateAddressState: null == updateAddressState
            ? _value.updateAddressState
            : updateAddressState // ignore: cast_nullable_to_non_nullable
                  as CommonState,
      ),
    );
  }
}

/// @nodoc

class _$EditAddressStateImpl implements _EditAddressState {
  const _$EditAddressStateImpl({
    final List<Address>? addresses,
    this.addressDefault,
    final List<Provinces>? provinces,
    final List<Districts>? districts,
    final List<Ward>? wards,
    this.provinceCode = 0,
    this.districtCode = 0,
    this.wardCode = 0,
    this.recipientName = '',
    this.phone = '',
    this.province = '',
    this.district = '',
    this.ward = '',
    this.streetAddress = '',
    this.getAddressState = const CommonState.initial(),
    this.updateAddressState = const CommonState.initial(),
  }) : _addresses = addresses,
       _provinces = provinces,
       _districts = districts,
       _wards = wards;

  final List<Address>? _addresses;
  @override
  List<Address>? get addresses {
    final value = _addresses;
    if (value == null) return null;
    if (_addresses is EqualUnmodifiableListView) return _addresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Address? addressDefault;
  final List<Provinces>? _provinces;
  @override
  List<Provinces>? get provinces {
    final value = _provinces;
    if (value == null) return null;
    if (_provinces is EqualUnmodifiableListView) return _provinces;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Districts>? _districts;
  @override
  List<Districts>? get districts {
    final value = _districts;
    if (value == null) return null;
    if (_districts is EqualUnmodifiableListView) return _districts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Ward>? _wards;
  @override
  List<Ward>? get wards {
    final value = _wards;
    if (value == null) return null;
    if (_wards is EqualUnmodifiableListView) return _wards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final int provinceCode;
  @override
  @JsonKey()
  final int districtCode;
  @override
  @JsonKey()
  final int wardCode;
  @override
  @JsonKey()
  final String recipientName;
  @override
  @JsonKey()
  final String phone;
  @override
  @JsonKey()
  final String province;
  @override
  @JsonKey()
  final String district;
  @override
  @JsonKey()
  final String ward;
  @override
  @JsonKey()
  final String streetAddress;
  @override
  @JsonKey()
  final CommonState getAddressState;
  @override
  @JsonKey()
  final CommonState updateAddressState;

  @override
  String toString() {
    return 'EditAddressState(addresses: $addresses, addressDefault: $addressDefault, provinces: $provinces, districts: $districts, wards: $wards, provinceCode: $provinceCode, districtCode: $districtCode, wardCode: $wardCode, recipientName: $recipientName, phone: $phone, province: $province, district: $district, ward: $ward, streetAddress: $streetAddress, getAddressState: $getAddressState, updateAddressState: $updateAddressState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditAddressStateImpl &&
            const DeepCollectionEquality().equals(
              other._addresses,
              _addresses,
            ) &&
            (identical(other.addressDefault, addressDefault) ||
                other.addressDefault == addressDefault) &&
            const DeepCollectionEquality().equals(
              other._provinces,
              _provinces,
            ) &&
            const DeepCollectionEquality().equals(
              other._districts,
              _districts,
            ) &&
            const DeepCollectionEquality().equals(other._wards, _wards) &&
            (identical(other.provinceCode, provinceCode) ||
                other.provinceCode == provinceCode) &&
            (identical(other.districtCode, districtCode) ||
                other.districtCode == districtCode) &&
            (identical(other.wardCode, wardCode) ||
                other.wardCode == wardCode) &&
            (identical(other.recipientName, recipientName) ||
                other.recipientName == recipientName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.province, province) ||
                other.province == province) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.ward, ward) || other.ward == ward) &&
            (identical(other.streetAddress, streetAddress) ||
                other.streetAddress == streetAddress) &&
            (identical(other.getAddressState, getAddressState) ||
                other.getAddressState == getAddressState) &&
            (identical(other.updateAddressState, updateAddressState) ||
                other.updateAddressState == updateAddressState));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_addresses),
    addressDefault,
    const DeepCollectionEquality().hash(_provinces),
    const DeepCollectionEquality().hash(_districts),
    const DeepCollectionEquality().hash(_wards),
    provinceCode,
    districtCode,
    wardCode,
    recipientName,
    phone,
    province,
    district,
    ward,
    streetAddress,
    getAddressState,
    updateAddressState,
  );

  /// Create a copy of EditAddressState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EditAddressStateImplCopyWith<_$EditAddressStateImpl> get copyWith =>
      __$$EditAddressStateImplCopyWithImpl<_$EditAddressStateImpl>(
        this,
        _$identity,
      );
}

abstract class _EditAddressState implements EditAddressState {
  const factory _EditAddressState({
    final List<Address>? addresses,
    final Address? addressDefault,
    final List<Provinces>? provinces,
    final List<Districts>? districts,
    final List<Ward>? wards,
    final int provinceCode,
    final int districtCode,
    final int wardCode,
    final String recipientName,
    final String phone,
    final String province,
    final String district,
    final String ward,
    final String streetAddress,
    final CommonState getAddressState,
    final CommonState updateAddressState,
  }) = _$EditAddressStateImpl;

  @override
  List<Address>? get addresses;
  @override
  Address? get addressDefault;
  @override
  List<Provinces>? get provinces;
  @override
  List<Districts>? get districts;
  @override
  List<Ward>? get wards;
  @override
  int get provinceCode;
  @override
  int get districtCode;
  @override
  int get wardCode;
  @override
  String get recipientName;
  @override
  String get phone;
  @override
  String get province;
  @override
  String get district;
  @override
  String get ward;
  @override
  String get streetAddress;
  @override
  CommonState get getAddressState;
  @override
  CommonState get updateAddressState;

  /// Create a copy of EditAddressState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditAddressStateImplCopyWith<_$EditAddressStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
