// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_product_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AddProductToCartState {
  CommonState1 get state => throw _privateConstructorUsedError;
  Product? get product => throw _privateConstructorUsedError;

  /// Create a copy of AddProductToCartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddProductToCartStateCopyWith<AddProductToCartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddProductToCartStateCopyWith<$Res> {
  factory $AddProductToCartStateCopyWith(
    AddProductToCartState value,
    $Res Function(AddProductToCartState) then,
  ) = _$AddProductToCartStateCopyWithImpl<$Res, AddProductToCartState>;
  @useResult
  $Res call({CommonState1 state, Product? product});

  $CommonState1CopyWith<$Res> get state;
}

/// @nodoc
class _$AddProductToCartStateCopyWithImpl<
  $Res,
  $Val extends AddProductToCartState
>
    implements $AddProductToCartStateCopyWith<$Res> {
  _$AddProductToCartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddProductToCartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? state = null, Object? product = freezed}) {
    return _then(
      _value.copyWith(
            state: null == state
                ? _value.state
                : state // ignore: cast_nullable_to_non_nullable
                      as CommonState1,
            product: freezed == product
                ? _value.product
                : product // ignore: cast_nullable_to_non_nullable
                      as Product?,
          )
          as $Val,
    );
  }

  /// Create a copy of AddProductToCartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommonState1CopyWith<$Res> get state {
    return $CommonState1CopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AddProductToCartStateImplCopyWith<$Res>
    implements $AddProductToCartStateCopyWith<$Res> {
  factory _$$AddProductToCartStateImplCopyWith(
    _$AddProductToCartStateImpl value,
    $Res Function(_$AddProductToCartStateImpl) then,
  ) = __$$AddProductToCartStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CommonState1 state, Product? product});

  @override
  $CommonState1CopyWith<$Res> get state;
}

/// @nodoc
class __$$AddProductToCartStateImplCopyWithImpl<$Res>
    extends
        _$AddProductToCartStateCopyWithImpl<$Res, _$AddProductToCartStateImpl>
    implements _$$AddProductToCartStateImplCopyWith<$Res> {
  __$$AddProductToCartStateImplCopyWithImpl(
    _$AddProductToCartStateImpl _value,
    $Res Function(_$AddProductToCartStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AddProductToCartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? state = null, Object? product = freezed}) {
    return _then(
      _$AddProductToCartStateImpl(
        state: null == state
            ? _value.state
            : state // ignore: cast_nullable_to_non_nullable
                  as CommonState1,
        product: freezed == product
            ? _value.product
            : product // ignore: cast_nullable_to_non_nullable
                  as Product?,
      ),
    );
  }
}

/// @nodoc

class _$AddProductToCartStateImpl implements _AddProductToCartState {
  const _$AddProductToCartStateImpl({
    this.state = const CommonState1.initial(),
    this.product,
  });

  @override
  @JsonKey()
  final CommonState1 state;
  @override
  final Product? product;

  @override
  String toString() {
    return 'AddProductToCartState(state: $state, product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddProductToCartStateImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state, product);

  /// Create a copy of AddProductToCartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddProductToCartStateImplCopyWith<_$AddProductToCartStateImpl>
  get copyWith =>
      __$$AddProductToCartStateImplCopyWithImpl<_$AddProductToCartStateImpl>(
        this,
        _$identity,
      );
}

abstract class _AddProductToCartState implements AddProductToCartState {
  const factory _AddProductToCartState({
    final CommonState1 state,
    final Product? product,
  }) = _$AddProductToCartStateImpl;

  @override
  CommonState1 get state;
  @override
  Product? get product;

  /// Create a copy of AddProductToCartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddProductToCartStateImplCopyWith<_$AddProductToCartStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
