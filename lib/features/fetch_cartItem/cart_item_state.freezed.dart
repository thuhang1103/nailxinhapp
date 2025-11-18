// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_item_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CartItemState {
  List<CartItem> get cartItems => throw _privateConstructorUsedError;
  CommonState get cartItemState =>
      throw _privateConstructorUsedError; // derived data
  int get totalCartItem => throw _privateConstructorUsedError;
  double get totalPrice => throw _privateConstructorUsedError;
  int get isSelectAll => throw _privateConstructorUsedError;

  /// Create a copy of CartItemState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartItemStateCopyWith<CartItemState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemStateCopyWith<$Res> {
  factory $CartItemStateCopyWith(
    CartItemState value,
    $Res Function(CartItemState) then,
  ) = _$CartItemStateCopyWithImpl<$Res, CartItemState>;
  @useResult
  $Res call({
    List<CartItem> cartItems,
    CommonState cartItemState,
    int totalCartItem,
    double totalPrice,
    int isSelectAll,
  });

  $CommonStateCopyWith<$Res> get cartItemState;
}

/// @nodoc
class _$CartItemStateCopyWithImpl<$Res, $Val extends CartItemState>
    implements $CartItemStateCopyWith<$Res> {
  _$CartItemStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartItemState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartItems = null,
    Object? cartItemState = null,
    Object? totalCartItem = null,
    Object? totalPrice = null,
    Object? isSelectAll = null,
  }) {
    return _then(
      _value.copyWith(
            cartItems: null == cartItems
                ? _value.cartItems
                : cartItems // ignore: cast_nullable_to_non_nullable
                      as List<CartItem>,
            cartItemState: null == cartItemState
                ? _value.cartItemState
                : cartItemState // ignore: cast_nullable_to_non_nullable
                      as CommonState,
            totalCartItem: null == totalCartItem
                ? _value.totalCartItem
                : totalCartItem // ignore: cast_nullable_to_non_nullable
                      as int,
            totalPrice: null == totalPrice
                ? _value.totalPrice
                : totalPrice // ignore: cast_nullable_to_non_nullable
                      as double,
            isSelectAll: null == isSelectAll
                ? _value.isSelectAll
                : isSelectAll // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }

  /// Create a copy of CartItemState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommonStateCopyWith<$Res> get cartItemState {
    return $CommonStateCopyWith<$Res>(_value.cartItemState, (value) {
      return _then(_value.copyWith(cartItemState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CartItemStateImplCopyWith<$Res>
    implements $CartItemStateCopyWith<$Res> {
  factory _$$CartItemStateImplCopyWith(
    _$CartItemStateImpl value,
    $Res Function(_$CartItemStateImpl) then,
  ) = __$$CartItemStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<CartItem> cartItems,
    CommonState cartItemState,
    int totalCartItem,
    double totalPrice,
    int isSelectAll,
  });

  @override
  $CommonStateCopyWith<$Res> get cartItemState;
}

/// @nodoc
class __$$CartItemStateImplCopyWithImpl<$Res>
    extends _$CartItemStateCopyWithImpl<$Res, _$CartItemStateImpl>
    implements _$$CartItemStateImplCopyWith<$Res> {
  __$$CartItemStateImplCopyWithImpl(
    _$CartItemStateImpl _value,
    $Res Function(_$CartItemStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartItemState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartItems = null,
    Object? cartItemState = null,
    Object? totalCartItem = null,
    Object? totalPrice = null,
    Object? isSelectAll = null,
  }) {
    return _then(
      _$CartItemStateImpl(
        cartItems: null == cartItems
            ? _value._cartItems
            : cartItems // ignore: cast_nullable_to_non_nullable
                  as List<CartItem>,
        cartItemState: null == cartItemState
            ? _value.cartItemState
            : cartItemState // ignore: cast_nullable_to_non_nullable
                  as CommonState,
        totalCartItem: null == totalCartItem
            ? _value.totalCartItem
            : totalCartItem // ignore: cast_nullable_to_non_nullable
                  as int,
        totalPrice: null == totalPrice
            ? _value.totalPrice
            : totalPrice // ignore: cast_nullable_to_non_nullable
                  as double,
        isSelectAll: null == isSelectAll
            ? _value.isSelectAll
            : isSelectAll // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$CartItemStateImpl implements _CartItemState {
  const _$CartItemStateImpl({
    final List<CartItem> cartItems = const [],
    this.cartItemState = const CommonState.initial(),
    this.totalCartItem = 0,
    this.totalPrice = 0.0,
    this.isSelectAll = 0,
  }) : _cartItems = cartItems;

  final List<CartItem> _cartItems;
  @override
  @JsonKey()
  List<CartItem> get cartItems {
    if (_cartItems is EqualUnmodifiableListView) return _cartItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cartItems);
  }

  @override
  @JsonKey()
  final CommonState cartItemState;
  // derived data
  @override
  @JsonKey()
  final int totalCartItem;
  @override
  @JsonKey()
  final double totalPrice;
  @override
  @JsonKey()
  final int isSelectAll;

  @override
  String toString() {
    return 'CartItemState(cartItems: $cartItems, cartItemState: $cartItemState, totalCartItem: $totalCartItem, totalPrice: $totalPrice, isSelectAll: $isSelectAll)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartItemStateImpl &&
            const DeepCollectionEquality().equals(
              other._cartItems,
              _cartItems,
            ) &&
            (identical(other.cartItemState, cartItemState) ||
                other.cartItemState == cartItemState) &&
            (identical(other.totalCartItem, totalCartItem) ||
                other.totalCartItem == totalCartItem) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.isSelectAll, isSelectAll) ||
                other.isSelectAll == isSelectAll));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_cartItems),
    cartItemState,
    totalCartItem,
    totalPrice,
    isSelectAll,
  );

  /// Create a copy of CartItemState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartItemStateImplCopyWith<_$CartItemStateImpl> get copyWith =>
      __$$CartItemStateImplCopyWithImpl<_$CartItemStateImpl>(this, _$identity);
}

abstract class _CartItemState implements CartItemState {
  const factory _CartItemState({
    final List<CartItem> cartItems,
    final CommonState cartItemState,
    final int totalCartItem,
    final double totalPrice,
    final int isSelectAll,
  }) = _$CartItemStateImpl;

  @override
  List<CartItem> get cartItems;
  @override
  CommonState get cartItemState; // derived data
  @override
  int get totalCartItem;
  @override
  double get totalPrice;
  @override
  int get isSelectAll;

  /// Create a copy of CartItemState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartItemStateImplCopyWith<_$CartItemStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
