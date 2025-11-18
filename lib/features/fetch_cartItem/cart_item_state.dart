import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/cart_item.dart';
import '../../core/common_state.dart';

part 'cart_item_state.freezed.dart';

@freezed
class CartItemState with _$CartItemState {
  const factory CartItemState({
    @Default([]) List<CartItem> cartItems,
    @Default(CommonState.initial()) CommonState cartItemState,
    // derived data
    @Default(0) int totalCartItem,
    @Default(0.0) double totalPrice,
    @Default(0) int isSelectAll,
  }) = _CartItemState;
}

CartItemState initial() => CartItemState();
