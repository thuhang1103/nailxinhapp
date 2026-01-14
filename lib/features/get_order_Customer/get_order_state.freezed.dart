// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_order_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$GetOrderState {
  List<Order> get orders => throw _privateConstructorUsedError;
  CommonState get getOrderState => throw _privateConstructorUsedError;

  /// Create a copy of GetOrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetOrderStateCopyWith<GetOrderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetOrderStateCopyWith<$Res> {
  factory $GetOrderStateCopyWith(
    GetOrderState value,
    $Res Function(GetOrderState) then,
  ) = _$GetOrderStateCopyWithImpl<$Res, GetOrderState>;
  @useResult
  $Res call({List<Order> orders, CommonState getOrderState});

  $CommonStateCopyWith<$Res> get getOrderState;
}

/// @nodoc
class _$GetOrderStateCopyWithImpl<$Res, $Val extends GetOrderState>
    implements $GetOrderStateCopyWith<$Res> {
  _$GetOrderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetOrderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? orders = null, Object? getOrderState = null}) {
    return _then(
      _value.copyWith(
            orders: null == orders
                ? _value.orders
                : orders // ignore: cast_nullable_to_non_nullable
                      as List<Order>,
            getOrderState: null == getOrderState
                ? _value.getOrderState
                : getOrderState // ignore: cast_nullable_to_non_nullable
                      as CommonState,
          )
          as $Val,
    );
  }

  /// Create a copy of GetOrderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommonStateCopyWith<$Res> get getOrderState {
    return $CommonStateCopyWith<$Res>(_value.getOrderState, (value) {
      return _then(_value.copyWith(getOrderState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetOrderStateImplCopyWith<$Res>
    implements $GetOrderStateCopyWith<$Res> {
  factory _$$GetOrderStateImplCopyWith(
    _$GetOrderStateImpl value,
    $Res Function(_$GetOrderStateImpl) then,
  ) = __$$GetOrderStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Order> orders, CommonState getOrderState});

  @override
  $CommonStateCopyWith<$Res> get getOrderState;
}

/// @nodoc
class __$$GetOrderStateImplCopyWithImpl<$Res>
    extends _$GetOrderStateCopyWithImpl<$Res, _$GetOrderStateImpl>
    implements _$$GetOrderStateImplCopyWith<$Res> {
  __$$GetOrderStateImplCopyWithImpl(
    _$GetOrderStateImpl _value,
    $Res Function(_$GetOrderStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetOrderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? orders = null, Object? getOrderState = null}) {
    return _then(
      _$GetOrderStateImpl(
        orders: null == orders
            ? _value._orders
            : orders // ignore: cast_nullable_to_non_nullable
                  as List<Order>,
        getOrderState: null == getOrderState
            ? _value.getOrderState
            : getOrderState // ignore: cast_nullable_to_non_nullable
                  as CommonState,
      ),
    );
  }
}

/// @nodoc

class _$GetOrderStateImpl implements _GetOrderState {
  const _$GetOrderStateImpl({
    final List<Order> orders = const [],
    this.getOrderState = const CommonState.initial(),
  }) : _orders = orders;

  final List<Order> _orders;
  @override
  @JsonKey()
  List<Order> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  @override
  @JsonKey()
  final CommonState getOrderState;

  @override
  String toString() {
    return 'GetOrderState(orders: $orders, getOrderState: $getOrderState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetOrderStateImpl &&
            const DeepCollectionEquality().equals(other._orders, _orders) &&
            (identical(other.getOrderState, getOrderState) ||
                other.getOrderState == getOrderState));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_orders),
    getOrderState,
  );

  /// Create a copy of GetOrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetOrderStateImplCopyWith<_$GetOrderStateImpl> get copyWith =>
      __$$GetOrderStateImplCopyWithImpl<_$GetOrderStateImpl>(this, _$identity);
}

abstract class _GetOrderState implements GetOrderState {
  const factory _GetOrderState({
    final List<Order> orders,
    final CommonState getOrderState,
  }) = _$GetOrderStateImpl;

  @override
  List<Order> get orders;
  @override
  CommonState get getOrderState;

  /// Create a copy of GetOrderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetOrderStateImplCopyWith<_$GetOrderStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
