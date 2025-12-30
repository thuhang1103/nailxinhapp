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
  List<FullOption> get fullOptions => throw _privateConstructorUsedError;
  Map<int, int> get selectedValues => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  int? get stock => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  CommonState get addToCartState => throw _privateConstructorUsedError;

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
  $Res call({
    List<FullOption> fullOptions,
    Map<int, int> selectedValues,
    double? price,
    int? stock,
    int quantity,
    CommonState addToCartState,
  });

  $CommonStateCopyWith<$Res> get addToCartState;
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
  $Res call({
    Object? fullOptions = null,
    Object? selectedValues = null,
    Object? price = freezed,
    Object? stock = freezed,
    Object? quantity = null,
    Object? addToCartState = null,
  }) {
    return _then(
      _value.copyWith(
            fullOptions: null == fullOptions
                ? _value.fullOptions
                : fullOptions // ignore: cast_nullable_to_non_nullable
                      as List<FullOption>,
            selectedValues: null == selectedValues
                ? _value.selectedValues
                : selectedValues // ignore: cast_nullable_to_non_nullable
                      as Map<int, int>,
            price: freezed == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as double?,
            stock: freezed == stock
                ? _value.stock
                : stock // ignore: cast_nullable_to_non_nullable
                      as int?,
            quantity: null == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                      as int,
            addToCartState: null == addToCartState
                ? _value.addToCartState
                : addToCartState // ignore: cast_nullable_to_non_nullable
                      as CommonState,
          )
          as $Val,
    );
  }

  /// Create a copy of AddProductToCartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommonStateCopyWith<$Res> get addToCartState {
    return $CommonStateCopyWith<$Res>(_value.addToCartState, (value) {
      return _then(_value.copyWith(addToCartState: value) as $Val);
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
  $Res call({
    List<FullOption> fullOptions,
    Map<int, int> selectedValues,
    double? price,
    int? stock,
    int quantity,
    CommonState addToCartState,
  });

  @override
  $CommonStateCopyWith<$Res> get addToCartState;
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
  $Res call({
    Object? fullOptions = null,
    Object? selectedValues = null,
    Object? price = freezed,
    Object? stock = freezed,
    Object? quantity = null,
    Object? addToCartState = null,
  }) {
    return _then(
      _$AddProductToCartStateImpl(
        fullOptions: null == fullOptions
            ? _value._fullOptions
            : fullOptions // ignore: cast_nullable_to_non_nullable
                  as List<FullOption>,
        selectedValues: null == selectedValues
            ? _value._selectedValues
            : selectedValues // ignore: cast_nullable_to_non_nullable
                  as Map<int, int>,
        price: freezed == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as double?,
        stock: freezed == stock
            ? _value.stock
            : stock // ignore: cast_nullable_to_non_nullable
                  as int?,
        quantity: null == quantity
            ? _value.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                  as int,
        addToCartState: null == addToCartState
            ? _value.addToCartState
            : addToCartState // ignore: cast_nullable_to_non_nullable
                  as CommonState,
      ),
    );
  }
}

/// @nodoc

class _$AddProductToCartStateImpl implements _AddProductToCartState {
  const _$AddProductToCartStateImpl({
    final List<FullOption> fullOptions = const [],
    final Map<int, int> selectedValues = const {},
    this.price,
    this.stock,
    this.quantity = 1,
    this.addToCartState = const CommonState.initial(),
  }) : _fullOptions = fullOptions,
       _selectedValues = selectedValues;

  final List<FullOption> _fullOptions;
  @override
  @JsonKey()
  List<FullOption> get fullOptions {
    if (_fullOptions is EqualUnmodifiableListView) return _fullOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fullOptions);
  }

  final Map<int, int> _selectedValues;
  @override
  @JsonKey()
  Map<int, int> get selectedValues {
    if (_selectedValues is EqualUnmodifiableMapView) return _selectedValues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_selectedValues);
  }

  @override
  final double? price;
  @override
  final int? stock;
  @override
  @JsonKey()
  final int quantity;
  @override
  @JsonKey()
  final CommonState addToCartState;

  @override
  String toString() {
    return 'AddProductToCartState(fullOptions: $fullOptions, selectedValues: $selectedValues, price: $price, stock: $stock, quantity: $quantity, addToCartState: $addToCartState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddProductToCartStateImpl &&
            const DeepCollectionEquality().equals(
              other._fullOptions,
              _fullOptions,
            ) &&
            const DeepCollectionEquality().equals(
              other._selectedValues,
              _selectedValues,
            ) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.addToCartState, addToCartState) ||
                other.addToCartState == addToCartState));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_fullOptions),
    const DeepCollectionEquality().hash(_selectedValues),
    price,
    stock,
    quantity,
    addToCartState,
  );

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
    final List<FullOption> fullOptions,
    final Map<int, int> selectedValues,
    final double? price,
    final int? stock,
    final int quantity,
    final CommonState addToCartState,
  }) = _$AddProductToCartStateImpl;

  @override
  List<FullOption> get fullOptions;
  @override
  Map<int, int> get selectedValues;
  @override
  double? get price;
  @override
  int? get stock;
  @override
  int get quantity;
  @override
  CommonState get addToCartState;

  /// Create a copy of AddProductToCartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddProductToCartStateImplCopyWith<_$AddProductToCartStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
