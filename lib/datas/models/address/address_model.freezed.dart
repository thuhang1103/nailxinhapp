// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) {
  return _AddressModel.fromJson(json);
}

/// @nodoc
mixin _$AddressModel {
  @JsonKey(name: 'AddressID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'RecipientName')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'Phone')
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProvinceCode')
  int? get provinceCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'DistrictCode')
  int? get districtCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'WardCode')
  int? get wardCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'StreetAddress')
  String? get streetAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'FullAddress')
  String? get fullAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'Province')
  String? get provinceName => throw _privateConstructorUsedError;
  @JsonKey(name: 'District')
  String? get districtName => throw _privateConstructorUsedError;
  @JsonKey(name: 'Ward')
  String? get wardName => throw _privateConstructorUsedError;

  /// Serializes this AddressModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddressModelCopyWith<AddressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressModelCopyWith<$Res> {
  factory $AddressModelCopyWith(
    AddressModel value,
    $Res Function(AddressModel) then,
  ) = _$AddressModelCopyWithImpl<$Res, AddressModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'AddressID') int? id,
    @JsonKey(name: 'RecipientName') String? name,
    @JsonKey(name: 'Phone') String? phone,
    @JsonKey(name: 'ProvinceCode') int? provinceCode,
    @JsonKey(name: 'DistrictCode') int? districtCode,
    @JsonKey(name: 'WardCode') int? wardCode,
    @JsonKey(name: 'StreetAddress') String? streetAddress,
    @JsonKey(name: 'FullAddress') String? fullAddress,
    @JsonKey(name: 'Province') String? provinceName,
    @JsonKey(name: 'District') String? districtName,
    @JsonKey(name: 'Ward') String? wardName,
  });
}

/// @nodoc
class _$AddressModelCopyWithImpl<$Res, $Val extends AddressModel>
    implements $AddressModelCopyWith<$Res> {
  _$AddressModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? phone = freezed,
    Object? provinceCode = freezed,
    Object? districtCode = freezed,
    Object? wardCode = freezed,
    Object? streetAddress = freezed,
    Object? fullAddress = freezed,
    Object? provinceName = freezed,
    Object? districtName = freezed,
    Object? wardName = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            phone: freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String?,
            provinceCode: freezed == provinceCode
                ? _value.provinceCode
                : provinceCode // ignore: cast_nullable_to_non_nullable
                      as int?,
            districtCode: freezed == districtCode
                ? _value.districtCode
                : districtCode // ignore: cast_nullable_to_non_nullable
                      as int?,
            wardCode: freezed == wardCode
                ? _value.wardCode
                : wardCode // ignore: cast_nullable_to_non_nullable
                      as int?,
            streetAddress: freezed == streetAddress
                ? _value.streetAddress
                : streetAddress // ignore: cast_nullable_to_non_nullable
                      as String?,
            fullAddress: freezed == fullAddress
                ? _value.fullAddress
                : fullAddress // ignore: cast_nullable_to_non_nullable
                      as String?,
            provinceName: freezed == provinceName
                ? _value.provinceName
                : provinceName // ignore: cast_nullable_to_non_nullable
                      as String?,
            districtName: freezed == districtName
                ? _value.districtName
                : districtName // ignore: cast_nullable_to_non_nullable
                      as String?,
            wardName: freezed == wardName
                ? _value.wardName
                : wardName // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AddressModelImplCopyWith<$Res>
    implements $AddressModelCopyWith<$Res> {
  factory _$$AddressModelImplCopyWith(
    _$AddressModelImpl value,
    $Res Function(_$AddressModelImpl) then,
  ) = __$$AddressModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'AddressID') int? id,
    @JsonKey(name: 'RecipientName') String? name,
    @JsonKey(name: 'Phone') String? phone,
    @JsonKey(name: 'ProvinceCode') int? provinceCode,
    @JsonKey(name: 'DistrictCode') int? districtCode,
    @JsonKey(name: 'WardCode') int? wardCode,
    @JsonKey(name: 'StreetAddress') String? streetAddress,
    @JsonKey(name: 'FullAddress') String? fullAddress,
    @JsonKey(name: 'Province') String? provinceName,
    @JsonKey(name: 'District') String? districtName,
    @JsonKey(name: 'Ward') String? wardName,
  });
}

/// @nodoc
class __$$AddressModelImplCopyWithImpl<$Res>
    extends _$AddressModelCopyWithImpl<$Res, _$AddressModelImpl>
    implements _$$AddressModelImplCopyWith<$Res> {
  __$$AddressModelImplCopyWithImpl(
    _$AddressModelImpl _value,
    $Res Function(_$AddressModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? phone = freezed,
    Object? provinceCode = freezed,
    Object? districtCode = freezed,
    Object? wardCode = freezed,
    Object? streetAddress = freezed,
    Object? fullAddress = freezed,
    Object? provinceName = freezed,
    Object? districtName = freezed,
    Object? wardName = freezed,
  }) {
    return _then(
      _$AddressModelImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        phone: freezed == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
        provinceCode: freezed == provinceCode
            ? _value.provinceCode
            : provinceCode // ignore: cast_nullable_to_non_nullable
                  as int?,
        districtCode: freezed == districtCode
            ? _value.districtCode
            : districtCode // ignore: cast_nullable_to_non_nullable
                  as int?,
        wardCode: freezed == wardCode
            ? _value.wardCode
            : wardCode // ignore: cast_nullable_to_non_nullable
                  as int?,
        streetAddress: freezed == streetAddress
            ? _value.streetAddress
            : streetAddress // ignore: cast_nullable_to_non_nullable
                  as String?,
        fullAddress: freezed == fullAddress
            ? _value.fullAddress
            : fullAddress // ignore: cast_nullable_to_non_nullable
                  as String?,
        provinceName: freezed == provinceName
            ? _value.provinceName
            : provinceName // ignore: cast_nullable_to_non_nullable
                  as String?,
        districtName: freezed == districtName
            ? _value.districtName
            : districtName // ignore: cast_nullable_to_non_nullable
                  as String?,
        wardName: freezed == wardName
            ? _value.wardName
            : wardName // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressModelImpl extends _AddressModel {
  const _$AddressModelImpl({
    @JsonKey(name: 'AddressID') this.id,
    @JsonKey(name: 'RecipientName') this.name,
    @JsonKey(name: 'Phone') this.phone,
    @JsonKey(name: 'ProvinceCode') this.provinceCode,
    @JsonKey(name: 'DistrictCode') this.districtCode,
    @JsonKey(name: 'WardCode') this.wardCode,
    @JsonKey(name: 'StreetAddress') this.streetAddress,
    @JsonKey(name: 'FullAddress') this.fullAddress,
    @JsonKey(name: 'Province') this.provinceName,
    @JsonKey(name: 'District') this.districtName,
    @JsonKey(name: 'Ward') this.wardName,
  }) : super._();

  factory _$AddressModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressModelImplFromJson(json);

  @override
  @JsonKey(name: 'AddressID')
  final int? id;
  @override
  @JsonKey(name: 'RecipientName')
  final String? name;
  @override
  @JsonKey(name: 'Phone')
  final String? phone;
  @override
  @JsonKey(name: 'ProvinceCode')
  final int? provinceCode;
  @override
  @JsonKey(name: 'DistrictCode')
  final int? districtCode;
  @override
  @JsonKey(name: 'WardCode')
  final int? wardCode;
  @override
  @JsonKey(name: 'StreetAddress')
  final String? streetAddress;
  @override
  @JsonKey(name: 'FullAddress')
  final String? fullAddress;
  @override
  @JsonKey(name: 'Province')
  final String? provinceName;
  @override
  @JsonKey(name: 'District')
  final String? districtName;
  @override
  @JsonKey(name: 'Ward')
  final String? wardName;

  @override
  String toString() {
    return 'AddressModel(id: $id, name: $name, phone: $phone, provinceCode: $provinceCode, districtCode: $districtCode, wardCode: $wardCode, streetAddress: $streetAddress, fullAddress: $fullAddress, provinceName: $provinceName, districtName: $districtName, wardName: $wardName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.provinceCode, provinceCode) ||
                other.provinceCode == provinceCode) &&
            (identical(other.districtCode, districtCode) ||
                other.districtCode == districtCode) &&
            (identical(other.wardCode, wardCode) ||
                other.wardCode == wardCode) &&
            (identical(other.streetAddress, streetAddress) ||
                other.streetAddress == streetAddress) &&
            (identical(other.fullAddress, fullAddress) ||
                other.fullAddress == fullAddress) &&
            (identical(other.provinceName, provinceName) ||
                other.provinceName == provinceName) &&
            (identical(other.districtName, districtName) ||
                other.districtName == districtName) &&
            (identical(other.wardName, wardName) ||
                other.wardName == wardName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    phone,
    provinceCode,
    districtCode,
    wardCode,
    streetAddress,
    fullAddress,
    provinceName,
    districtName,
    wardName,
  );

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressModelImplCopyWith<_$AddressModelImpl> get copyWith =>
      __$$AddressModelImplCopyWithImpl<_$AddressModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressModelImplToJson(this);
  }
}

abstract class _AddressModel extends AddressModel {
  const factory _AddressModel({
    @JsonKey(name: 'AddressID') final int? id,
    @JsonKey(name: 'RecipientName') final String? name,
    @JsonKey(name: 'Phone') final String? phone,
    @JsonKey(name: 'ProvinceCode') final int? provinceCode,
    @JsonKey(name: 'DistrictCode') final int? districtCode,
    @JsonKey(name: 'WardCode') final int? wardCode,
    @JsonKey(name: 'StreetAddress') final String? streetAddress,
    @JsonKey(name: 'FullAddress') final String? fullAddress,
    @JsonKey(name: 'Province') final String? provinceName,
    @JsonKey(name: 'District') final String? districtName,
    @JsonKey(name: 'Ward') final String? wardName,
  }) = _$AddressModelImpl;
  const _AddressModel._() : super._();

  factory _AddressModel.fromJson(Map<String, dynamic> json) =
      _$AddressModelImpl.fromJson;

  @override
  @JsonKey(name: 'AddressID')
  int? get id;
  @override
  @JsonKey(name: 'RecipientName')
  String? get name;
  @override
  @JsonKey(name: 'Phone')
  String? get phone;
  @override
  @JsonKey(name: 'ProvinceCode')
  int? get provinceCode;
  @override
  @JsonKey(name: 'DistrictCode')
  int? get districtCode;
  @override
  @JsonKey(name: 'WardCode')
  int? get wardCode;
  @override
  @JsonKey(name: 'StreetAddress')
  String? get streetAddress;
  @override
  @JsonKey(name: 'FullAddress')
  String? get fullAddress;
  @override
  @JsonKey(name: 'Province')
  String? get provinceName;
  @override
  @JsonKey(name: 'District')
  String? get districtName;
  @override
  @JsonKey(name: 'Ward')
  String? get wardName;

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddressModelImplCopyWith<_$AddressModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
