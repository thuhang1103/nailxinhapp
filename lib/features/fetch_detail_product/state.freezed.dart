// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$FetchProductState {
  CommonState get state => throw _privateConstructorUsedError;
  Product? get product => throw _privateConstructorUsedError;

  /// Create a copy of FetchProductState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FetchProductStateCopyWith<FetchProductState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchProductStateCopyWith<$Res> {
  factory $FetchProductStateCopyWith(
    FetchProductState value,
    $Res Function(FetchProductState) then,
  ) = _$FetchProductStateCopyWithImpl<$Res, FetchProductState>;
  @useResult
  $Res call({CommonState state, Product? product});

  $CommonStateCopyWith<$Res> get state;
}

/// @nodoc
class _$FetchProductStateCopyWithImpl<$Res, $Val extends FetchProductState>
    implements $FetchProductStateCopyWith<$Res> {
  _$FetchProductStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FetchProductState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? state = null, Object? product = freezed}) {
    return _then(
      _value.copyWith(
            state: null == state
                ? _value.state
                : state // ignore: cast_nullable_to_non_nullable
                      as CommonState,
            product: freezed == product
                ? _value.product
                : product // ignore: cast_nullable_to_non_nullable
                      as Product?,
          )
          as $Val,
    );
  }

  /// Create a copy of FetchProductState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommonStateCopyWith<$Res> get state {
    return $CommonStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FetchProductStateImplCopyWith<$Res>
    implements $FetchProductStateCopyWith<$Res> {
  factory _$$FetchProductStateImplCopyWith(
    _$FetchProductStateImpl value,
    $Res Function(_$FetchProductStateImpl) then,
  ) = __$$FetchProductStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CommonState state, Product? product});

  @override
  $CommonStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$FetchProductStateImplCopyWithImpl<$Res>
    extends _$FetchProductStateCopyWithImpl<$Res, _$FetchProductStateImpl>
    implements _$$FetchProductStateImplCopyWith<$Res> {
  __$$FetchProductStateImplCopyWithImpl(
    _$FetchProductStateImpl _value,
    $Res Function(_$FetchProductStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FetchProductState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? state = null, Object? product = freezed}) {
    return _then(
      _$FetchProductStateImpl(
        state: null == state
            ? _value.state
            : state // ignore: cast_nullable_to_non_nullable
                  as CommonState,
        product: freezed == product
            ? _value.product
            : product // ignore: cast_nullable_to_non_nullable
                  as Product?,
      ),
    );
  }
}

/// @nodoc

class _$FetchProductStateImpl implements _FetchProductState {
  const _$FetchProductStateImpl({
    this.state = const CommonState.initial(),
    this.product,
  });

  @override
  @JsonKey()
  final CommonState state;
  @override
  final Product? product;

  @override
  String toString() {
    return 'FetchProductState(state: $state, product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchProductStateImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state, product);

  /// Create a copy of FetchProductState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchProductStateImplCopyWith<_$FetchProductStateImpl> get copyWith =>
      __$$FetchProductStateImplCopyWithImpl<_$FetchProductStateImpl>(
        this,
        _$identity,
      );
}

abstract class _FetchProductState implements FetchProductState {
  const factory _FetchProductState({
    final CommonState state,
    final Product? product,
  }) = _$FetchProductStateImpl;

  @override
  CommonState get state;
  @override
  Product? get product;

  /// Create a copy of FetchProductState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchProductStateImplCopyWith<_$FetchProductStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
