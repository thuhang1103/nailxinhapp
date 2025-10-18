//freezed
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/products.dart';
import '../../core/common_state.dart';

part 'add_product_state.freezed.dart';

@freezed
class AddProductToCartState with _$AddProductToCartState {
  const factory AddProductToCartState({
    @Default(CommonState1.initial()) CommonState1 state,
    Product? product,
  }) = _AddProductToCartState;
}

AddProductToCartState initial() => AddProductToCartState();
