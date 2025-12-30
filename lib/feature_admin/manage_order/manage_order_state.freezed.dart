// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manage_order_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ManageOrderState {
  List<Order> get orders => throw _privateConstructorUsedError;
  List<OrderDetail> get orderDetails => throw _privateConstructorUsedError;
  int? get orderId => throw _privateConstructorUsedError;
  CommonState get getOrderState => throw _privateConstructorUsedError;
  CommonState get getOrderDetailState => throw _privateConstructorUsedError;
  CommonState get updateOrderState => throw _privateConstructorUsedError;

  /// Create a copy of ManageOrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ManageOrderStateCopyWith<ManageOrderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManageOrderStateCopyWith<$Res> {
  factory $ManageOrderStateCopyWith(
    ManageOrderState value,
    $Res Function(ManageOrderState) then,
  ) = _$ManageOrderStateCopyWithImpl<$Res, ManageOrderState>;
  @useResult
  $Res call({
    List<Order> orders,
    List<OrderDetail> orderDetails,
    int? orderId,
    CommonState getOrderState,
    CommonState getOrderDetailState,
    CommonState updateOrderState,
  });

  $CommonStateCopyWith<$Res> get getOrderState;
  $CommonStateCopyWith<$Res> get getOrderDetailState;
  $CommonStateCopyWith<$Res> get updateOrderState;
}

/// @nodoc
class _$ManageOrderStateCopyWithImpl<$Res, $Val extends ManageOrderState>
    implements $ManageOrderStateCopyWith<$Res> {
  _$ManageOrderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ManageOrderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orders = null,
    Object? orderDetails = null,
    Object? orderId = freezed,
    Object? getOrderState = null,
    Object? getOrderDetailState = null,
    Object? updateOrderState = null,
  }) {
    return _then(
      _value.copyWith(
            orders: null == orders
                ? _value.orders
                : orders // ignore: cast_nullable_to_non_nullable
                      as List<Order>,
            orderDetails: null == orderDetails
                ? _value.orderDetails
                : orderDetails // ignore: cast_nullable_to_non_nullable
                      as List<OrderDetail>,
            orderId: freezed == orderId
                ? _value.orderId
                : orderId // ignore: cast_nullable_to_non_nullable
                      as int?,
            getOrderState: null == getOrderState
                ? _value.getOrderState
                : getOrderState // ignore: cast_nullable_to_non_nullable
                      as CommonState,
            getOrderDetailState: null == getOrderDetailState
                ? _value.getOrderDetailState
                : getOrderDetailState // ignore: cast_nullable_to_non_nullable
                      as CommonState,
            updateOrderState: null == updateOrderState
                ? _value.updateOrderState
                : updateOrderState // ignore: cast_nullable_to_non_nullable
                      as CommonState,
          )
          as $Val,
    );
  }

  /// Create a copy of ManageOrderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommonStateCopyWith<$Res> get getOrderState {
    return $CommonStateCopyWith<$Res>(_value.getOrderState, (value) {
      return _then(_value.copyWith(getOrderState: value) as $Val);
    });
  }

  /// Create a copy of ManageOrderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommonStateCopyWith<$Res> get getOrderDetailState {
    return $CommonStateCopyWith<$Res>(_value.getOrderDetailState, (value) {
      return _then(_value.copyWith(getOrderDetailState: value) as $Val);
    });
  }

  /// Create a copy of ManageOrderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommonStateCopyWith<$Res> get updateOrderState {
    return $CommonStateCopyWith<$Res>(_value.updateOrderState, (value) {
      return _then(_value.copyWith(updateOrderState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ManageOrderStateImplCopyWith<$Res>
    implements $ManageOrderStateCopyWith<$Res> {
  factory _$$ManageOrderStateImplCopyWith(
    _$ManageOrderStateImpl value,
    $Res Function(_$ManageOrderStateImpl) then,
  ) = __$$ManageOrderStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<Order> orders,
    List<OrderDetail> orderDetails,
    int? orderId,
    CommonState getOrderState,
    CommonState getOrderDetailState,
    CommonState updateOrderState,
  });

  @override
  $CommonStateCopyWith<$Res> get getOrderState;
  @override
  $CommonStateCopyWith<$Res> get getOrderDetailState;
  @override
  $CommonStateCopyWith<$Res> get updateOrderState;
}

/// @nodoc
class __$$ManageOrderStateImplCopyWithImpl<$Res>
    extends _$ManageOrderStateCopyWithImpl<$Res, _$ManageOrderStateImpl>
    implements _$$ManageOrderStateImplCopyWith<$Res> {
  __$$ManageOrderStateImplCopyWithImpl(
    _$ManageOrderStateImpl _value,
    $Res Function(_$ManageOrderStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ManageOrderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orders = null,
    Object? orderDetails = null,
    Object? orderId = freezed,
    Object? getOrderState = null,
    Object? getOrderDetailState = null,
    Object? updateOrderState = null,
  }) {
    return _then(
      _$ManageOrderStateImpl(
        orders: null == orders
            ? _value._orders
            : orders // ignore: cast_nullable_to_non_nullable
                  as List<Order>,
        orderDetails: null == orderDetails
            ? _value._orderDetails
            : orderDetails // ignore: cast_nullable_to_non_nullable
                  as List<OrderDetail>,
        orderId: freezed == orderId
            ? _value.orderId
            : orderId // ignore: cast_nullable_to_non_nullable
                  as int?,
        getOrderState: null == getOrderState
            ? _value.getOrderState
            : getOrderState // ignore: cast_nullable_to_non_nullable
                  as CommonState,
        getOrderDetailState: null == getOrderDetailState
            ? _value.getOrderDetailState
            : getOrderDetailState // ignore: cast_nullable_to_non_nullable
                  as CommonState,
        updateOrderState: null == updateOrderState
            ? _value.updateOrderState
            : updateOrderState // ignore: cast_nullable_to_non_nullable
                  as CommonState,
      ),
    );
  }
}

/// @nodoc

class _$ManageOrderStateImpl implements _ManageOrderState {
  const _$ManageOrderStateImpl({
    final List<Order> orders = const [],
    final List<OrderDetail> orderDetails = const [],
    this.orderId,
    this.getOrderState = const CommonState.initial(),
    this.getOrderDetailState = const CommonState.initial(),
    this.updateOrderState = const CommonState.initial(),
  }) : _orders = orders,
       _orderDetails = orderDetails;

  final List<Order> _orders;
  @override
  @JsonKey()
  List<Order> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  final List<OrderDetail> _orderDetails;
  @override
  @JsonKey()
  List<OrderDetail> get orderDetails {
    if (_orderDetails is EqualUnmodifiableListView) return _orderDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderDetails);
  }

  @override
  final int? orderId;
  @override
  @JsonKey()
  final CommonState getOrderState;
  @override
  @JsonKey()
  final CommonState getOrderDetailState;
  @override
  @JsonKey()
  final CommonState updateOrderState;

  @override
  String toString() {
    return 'ManageOrderState(orders: $orders, orderDetails: $orderDetails, orderId: $orderId, getOrderState: $getOrderState, getOrderDetailState: $getOrderDetailState, updateOrderState: $updateOrderState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ManageOrderStateImpl &&
            const DeepCollectionEquality().equals(other._orders, _orders) &&
            const DeepCollectionEquality().equals(
              other._orderDetails,
              _orderDetails,
            ) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.getOrderState, getOrderState) ||
                other.getOrderState == getOrderState) &&
            (identical(other.getOrderDetailState, getOrderDetailState) ||
                other.getOrderDetailState == getOrderDetailState) &&
            (identical(other.updateOrderState, updateOrderState) ||
                other.updateOrderState == updateOrderState));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_orders),
    const DeepCollectionEquality().hash(_orderDetails),
    orderId,
    getOrderState,
    getOrderDetailState,
    updateOrderState,
  );

  /// Create a copy of ManageOrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ManageOrderStateImplCopyWith<_$ManageOrderStateImpl> get copyWith =>
      __$$ManageOrderStateImplCopyWithImpl<_$ManageOrderStateImpl>(
        this,
        _$identity,
      );
}

abstract class _ManageOrderState implements ManageOrderState {
  const factory _ManageOrderState({
    final List<Order> orders,
    final List<OrderDetail> orderDetails,
    final int? orderId,
    final CommonState getOrderState,
    final CommonState getOrderDetailState,
    final CommonState updateOrderState,
  }) = _$ManageOrderStateImpl;

  @override
  List<Order> get orders;
  @override
  List<OrderDetail> get orderDetails;
  @override
  int? get orderId;
  @override
  CommonState get getOrderState;
  @override
  CommonState get getOrderDetailState;
  @override
  CommonState get updateOrderState;

  /// Create a copy of ManageOrderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ManageOrderStateImplCopyWith<_$ManageOrderStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
