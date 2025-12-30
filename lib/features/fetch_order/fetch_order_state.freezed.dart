// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fetch_order_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$FetchOrderState {
  List<CartItem>? get cartitems => throw _privateConstructorUsedError;
  List<Address> get addresses => throw _privateConstructorUsedError;
  List<Voucher> get vouches => throw _privateConstructorUsedError;
  Address? get addressDefault => throw _privateConstructorUsedError;
  Point? get point => throw _privateConstructorUsedError;
  Voucher? get voucher => throw _privateConstructorUsedError;
  int get usePoint => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  double get finalAmount => throw _privateConstructorUsedError;
  int get totalItems => throw _privateConstructorUsedError;
  int get wardCode => throw _privateConstructorUsedError;
  String get recipientName => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get province => throw _privateConstructorUsedError;
  String get district => throw _privateConstructorUsedError;
  String get ward => throw _privateConstructorUsedError;
  String get streetAddress => throw _privateConstructorUsedError;
  CommonState get loadDataState => throw _privateConstructorUsedError;
  CommonState get confirmOrderState => throw _privateConstructorUsedError;

  /// Create a copy of FetchOrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FetchOrderStateCopyWith<FetchOrderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchOrderStateCopyWith<$Res> {
  factory $FetchOrderStateCopyWith(
    FetchOrderState value,
    $Res Function(FetchOrderState) then,
  ) = _$FetchOrderStateCopyWithImpl<$Res, FetchOrderState>;
  @useResult
  $Res call({
    List<CartItem>? cartitems,
    List<Address> addresses,
    List<Voucher> vouches,
    Address? addressDefault,
    Point? point,
    Voucher? voucher,
    int usePoint,
    double total,
    double finalAmount,
    int totalItems,
    int wardCode,
    String recipientName,
    String phone,
    String province,
    String district,
    String ward,
    String streetAddress,
    CommonState loadDataState,
    CommonState confirmOrderState,
  });

  $AddressCopyWith<$Res>? get addressDefault;
  $PointCopyWith<$Res>? get point;
  $VoucherCopyWith<$Res>? get voucher;
  $CommonStateCopyWith<$Res> get loadDataState;
  $CommonStateCopyWith<$Res> get confirmOrderState;
}

/// @nodoc
class _$FetchOrderStateCopyWithImpl<$Res, $Val extends FetchOrderState>
    implements $FetchOrderStateCopyWith<$Res> {
  _$FetchOrderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FetchOrderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartitems = freezed,
    Object? addresses = null,
    Object? vouches = null,
    Object? addressDefault = freezed,
    Object? point = freezed,
    Object? voucher = freezed,
    Object? usePoint = null,
    Object? total = null,
    Object? finalAmount = null,
    Object? totalItems = null,
    Object? wardCode = null,
    Object? recipientName = null,
    Object? phone = null,
    Object? province = null,
    Object? district = null,
    Object? ward = null,
    Object? streetAddress = null,
    Object? loadDataState = null,
    Object? confirmOrderState = null,
  }) {
    return _then(
      _value.copyWith(
            cartitems: freezed == cartitems
                ? _value.cartitems
                : cartitems // ignore: cast_nullable_to_non_nullable
                      as List<CartItem>?,
            addresses: null == addresses
                ? _value.addresses
                : addresses // ignore: cast_nullable_to_non_nullable
                      as List<Address>,
            vouches: null == vouches
                ? _value.vouches
                : vouches // ignore: cast_nullable_to_non_nullable
                      as List<Voucher>,
            addressDefault: freezed == addressDefault
                ? _value.addressDefault
                : addressDefault // ignore: cast_nullable_to_non_nullable
                      as Address?,
            point: freezed == point
                ? _value.point
                : point // ignore: cast_nullable_to_non_nullable
                      as Point?,
            voucher: freezed == voucher
                ? _value.voucher
                : voucher // ignore: cast_nullable_to_non_nullable
                      as Voucher?,
            usePoint: null == usePoint
                ? _value.usePoint
                : usePoint // ignore: cast_nullable_to_non_nullable
                      as int,
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as double,
            finalAmount: null == finalAmount
                ? _value.finalAmount
                : finalAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            totalItems: null == totalItems
                ? _value.totalItems
                : totalItems // ignore: cast_nullable_to_non_nullable
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
            loadDataState: null == loadDataState
                ? _value.loadDataState
                : loadDataState // ignore: cast_nullable_to_non_nullable
                      as CommonState,
            confirmOrderState: null == confirmOrderState
                ? _value.confirmOrderState
                : confirmOrderState // ignore: cast_nullable_to_non_nullable
                      as CommonState,
          )
          as $Val,
    );
  }

  /// Create a copy of FetchOrderState
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

  /// Create a copy of FetchOrderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PointCopyWith<$Res>? get point {
    if (_value.point == null) {
      return null;
    }

    return $PointCopyWith<$Res>(_value.point!, (value) {
      return _then(_value.copyWith(point: value) as $Val);
    });
  }

  /// Create a copy of FetchOrderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VoucherCopyWith<$Res>? get voucher {
    if (_value.voucher == null) {
      return null;
    }

    return $VoucherCopyWith<$Res>(_value.voucher!, (value) {
      return _then(_value.copyWith(voucher: value) as $Val);
    });
  }

  /// Create a copy of FetchOrderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommonStateCopyWith<$Res> get loadDataState {
    return $CommonStateCopyWith<$Res>(_value.loadDataState, (value) {
      return _then(_value.copyWith(loadDataState: value) as $Val);
    });
  }

  /// Create a copy of FetchOrderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommonStateCopyWith<$Res> get confirmOrderState {
    return $CommonStateCopyWith<$Res>(_value.confirmOrderState, (value) {
      return _then(_value.copyWith(confirmOrderState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FetchOrderStateImplCopyWith<$Res>
    implements $FetchOrderStateCopyWith<$Res> {
  factory _$$FetchOrderStateImplCopyWith(
    _$FetchOrderStateImpl value,
    $Res Function(_$FetchOrderStateImpl) then,
  ) = __$$FetchOrderStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<CartItem>? cartitems,
    List<Address> addresses,
    List<Voucher> vouches,
    Address? addressDefault,
    Point? point,
    Voucher? voucher,
    int usePoint,
    double total,
    double finalAmount,
    int totalItems,
    int wardCode,
    String recipientName,
    String phone,
    String province,
    String district,
    String ward,
    String streetAddress,
    CommonState loadDataState,
    CommonState confirmOrderState,
  });

  @override
  $AddressCopyWith<$Res>? get addressDefault;
  @override
  $PointCopyWith<$Res>? get point;
  @override
  $VoucherCopyWith<$Res>? get voucher;
  @override
  $CommonStateCopyWith<$Res> get loadDataState;
  @override
  $CommonStateCopyWith<$Res> get confirmOrderState;
}

/// @nodoc
class __$$FetchOrderStateImplCopyWithImpl<$Res>
    extends _$FetchOrderStateCopyWithImpl<$Res, _$FetchOrderStateImpl>
    implements _$$FetchOrderStateImplCopyWith<$Res> {
  __$$FetchOrderStateImplCopyWithImpl(
    _$FetchOrderStateImpl _value,
    $Res Function(_$FetchOrderStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FetchOrderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartitems = freezed,
    Object? addresses = null,
    Object? vouches = null,
    Object? addressDefault = freezed,
    Object? point = freezed,
    Object? voucher = freezed,
    Object? usePoint = null,
    Object? total = null,
    Object? finalAmount = null,
    Object? totalItems = null,
    Object? wardCode = null,
    Object? recipientName = null,
    Object? phone = null,
    Object? province = null,
    Object? district = null,
    Object? ward = null,
    Object? streetAddress = null,
    Object? loadDataState = null,
    Object? confirmOrderState = null,
  }) {
    return _then(
      _$FetchOrderStateImpl(
        cartitems: freezed == cartitems
            ? _value._cartitems
            : cartitems // ignore: cast_nullable_to_non_nullable
                  as List<CartItem>?,
        addresses: null == addresses
            ? _value._addresses
            : addresses // ignore: cast_nullable_to_non_nullable
                  as List<Address>,
        vouches: null == vouches
            ? _value._vouches
            : vouches // ignore: cast_nullable_to_non_nullable
                  as List<Voucher>,
        addressDefault: freezed == addressDefault
            ? _value.addressDefault
            : addressDefault // ignore: cast_nullable_to_non_nullable
                  as Address?,
        point: freezed == point
            ? _value.point
            : point // ignore: cast_nullable_to_non_nullable
                  as Point?,
        voucher: freezed == voucher
            ? _value.voucher
            : voucher // ignore: cast_nullable_to_non_nullable
                  as Voucher?,
        usePoint: null == usePoint
            ? _value.usePoint
            : usePoint // ignore: cast_nullable_to_non_nullable
                  as int,
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as double,
        finalAmount: null == finalAmount
            ? _value.finalAmount
            : finalAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        totalItems: null == totalItems
            ? _value.totalItems
            : totalItems // ignore: cast_nullable_to_non_nullable
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
        loadDataState: null == loadDataState
            ? _value.loadDataState
            : loadDataState // ignore: cast_nullable_to_non_nullable
                  as CommonState,
        confirmOrderState: null == confirmOrderState
            ? _value.confirmOrderState
            : confirmOrderState // ignore: cast_nullable_to_non_nullable
                  as CommonState,
      ),
    );
  }
}

/// @nodoc

class _$FetchOrderStateImpl implements _FetchOrderState {
  const _$FetchOrderStateImpl({
    final List<CartItem>? cartitems,
    final List<Address> addresses = const [],
    final List<Voucher> vouches = const [],
    this.addressDefault,
    this.point,
    this.voucher,
    this.usePoint = 0,
    this.total = 0,
    this.finalAmount = 0,
    this.totalItems = 0,
    this.wardCode = 0,
    this.recipientName = '',
    this.phone = '',
    this.province = '',
    this.district = '',
    this.ward = '',
    this.streetAddress = '',
    this.loadDataState = const CommonState.initial(),
    this.confirmOrderState = const CommonState.initial(),
  }) : _cartitems = cartitems,
       _addresses = addresses,
       _vouches = vouches;

  final List<CartItem>? _cartitems;
  @override
  List<CartItem>? get cartitems {
    final value = _cartitems;
    if (value == null) return null;
    if (_cartitems is EqualUnmodifiableListView) return _cartitems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Address> _addresses;
  @override
  @JsonKey()
  List<Address> get addresses {
    if (_addresses is EqualUnmodifiableListView) return _addresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addresses);
  }

  final List<Voucher> _vouches;
  @override
  @JsonKey()
  List<Voucher> get vouches {
    if (_vouches is EqualUnmodifiableListView) return _vouches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vouches);
  }

  @override
  final Address? addressDefault;
  @override
  final Point? point;
  @override
  final Voucher? voucher;
  @override
  @JsonKey()
  final int usePoint;
  @override
  @JsonKey()
  final double total;
  @override
  @JsonKey()
  final double finalAmount;
  @override
  @JsonKey()
  final int totalItems;
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
  final CommonState loadDataState;
  @override
  @JsonKey()
  final CommonState confirmOrderState;

  @override
  String toString() {
    return 'FetchOrderState(cartitems: $cartitems, addresses: $addresses, vouches: $vouches, addressDefault: $addressDefault, point: $point, voucher: $voucher, usePoint: $usePoint, total: $total, finalAmount: $finalAmount, totalItems: $totalItems, wardCode: $wardCode, recipientName: $recipientName, phone: $phone, province: $province, district: $district, ward: $ward, streetAddress: $streetAddress, loadDataState: $loadDataState, confirmOrderState: $confirmOrderState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchOrderStateImpl &&
            const DeepCollectionEquality().equals(
              other._cartitems,
              _cartitems,
            ) &&
            const DeepCollectionEquality().equals(
              other._addresses,
              _addresses,
            ) &&
            const DeepCollectionEquality().equals(other._vouches, _vouches) &&
            (identical(other.addressDefault, addressDefault) ||
                other.addressDefault == addressDefault) &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.voucher, voucher) || other.voucher == voucher) &&
            (identical(other.usePoint, usePoint) ||
                other.usePoint == usePoint) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.finalAmount, finalAmount) ||
                other.finalAmount == finalAmount) &&
            (identical(other.totalItems, totalItems) ||
                other.totalItems == totalItems) &&
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
            (identical(other.loadDataState, loadDataState) ||
                other.loadDataState == loadDataState) &&
            (identical(other.confirmOrderState, confirmOrderState) ||
                other.confirmOrderState == confirmOrderState));
  }

  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    const DeepCollectionEquality().hash(_cartitems),
    const DeepCollectionEquality().hash(_addresses),
    const DeepCollectionEquality().hash(_vouches),
    addressDefault,
    point,
    voucher,
    usePoint,
    total,
    finalAmount,
    totalItems,
    wardCode,
    recipientName,
    phone,
    province,
    district,
    ward,
    streetAddress,
    loadDataState,
    confirmOrderState,
  ]);

  /// Create a copy of FetchOrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchOrderStateImplCopyWith<_$FetchOrderStateImpl> get copyWith =>
      __$$FetchOrderStateImplCopyWithImpl<_$FetchOrderStateImpl>(
        this,
        _$identity,
      );
}

abstract class _FetchOrderState implements FetchOrderState {
  const factory _FetchOrderState({
    final List<CartItem>? cartitems,
    final List<Address> addresses,
    final List<Voucher> vouches,
    final Address? addressDefault,
    final Point? point,
    final Voucher? voucher,
    final int usePoint,
    final double total,
    final double finalAmount,
    final int totalItems,
    final int wardCode,
    final String recipientName,
    final String phone,
    final String province,
    final String district,
    final String ward,
    final String streetAddress,
    final CommonState loadDataState,
    final CommonState confirmOrderState,
  }) = _$FetchOrderStateImpl;

  @override
  List<CartItem>? get cartitems;
  @override
  List<Address> get addresses;
  @override
  List<Voucher> get vouches;
  @override
  Address? get addressDefault;
  @override
  Point? get point;
  @override
  Voucher? get voucher;
  @override
  int get usePoint;
  @override
  double get total;
  @override
  double get finalAmount;
  @override
  int get totalItems;
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
  CommonState get loadDataState;
  @override
  CommonState get confirmOrderState;

  /// Create a copy of FetchOrderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchOrderStateImplCopyWith<_$FetchOrderStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
