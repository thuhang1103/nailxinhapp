import './cart_item_event.dart';
import './cart_item_state.dart';
import 'package:bloc/bloc.dart';
import '../../core/common_state.dart';
//usecase
import '../../domain/usecases/cartItem_usecase/get_all_cartItem_uc.dart';
import '../../domain/usecases/cartItem_usecase/delete_cartItem_usecase.dart';
import '../../domain/usecases/cartItem_usecase/update_cartItem_usecase.dart';

class CartItemBloc extends Bloc<CartItemEvent, CartItemState> {
  final GetAllCartItemUseCase getAll;
  final DeleteCartItemUseCase deleteCartItem;
  final UpdateCartItemUseCase updateCartItem;

  CartItemBloc({
    required this.getAll,
    required this.deleteCartItem,
    required this.updateCartItem,
  }) : super(const CartItemState()) {
    on<GetCartItemEvent>(_onGetCartItems);
    on<ChangeIsSelectedEvent>(_onChangeIsSelected);
    on<SelectAllCartItemsEvent>(_onSelectAllCartItems);
    on<DeleteCartItemEvent>(_onDeleteCartItem);
    on<IncreaseQuantityEvent>(_onIncreaseQuantity);
    on<DecreaseQuantityEvent>(_onDecreaseQuantity);
  }

  CartItemState _recalculate(CartItemState old) {
    final selectedItems = old.cartItems
        .where((item) => item.isSelected == 1)
        .toList();

    final totalPrice = selectedItems.fold<double>(
      0,
      (sum, item) => sum + (item.total),
    );

    final totalItem = old.cartItems.length;

    final isSelectAll =
        (selectedItems.length == old.cartItems.length &&
            old.cartItems.isNotEmpty)
        ? 1
        : 0;

    return old.copyWith(
      totalPrice: totalPrice,
      totalCartItem: totalItem,
      isSelectAll: isSelectAll,
    );
  }

  Future<void> _onGetCartItems(
    GetCartItemEvent event,
    Emitter<CartItemState> emit,
  ) async {
    try {
      emit(state.copyWith(cartItemState: const CommonState.loading()));
      final userID = await getAll.getUserID();

      final items = await getAll.getAllCartItems(userId: userID);

      emit(
        _recalculate(
          state.copyWith(
            cartItems: items,
            cartItemState: const CommonState.success(),
          ),
        ),
      );
    } catch (e) {
      print('Error in _onGetCartItems: $e');
      emit(state.copyWith(cartItemState: CommonState.error(e as Exception)));
    }
  }

  Future<void> _onChangeIsSelected(
    ChangeIsSelectedEvent event,
    Emitter<CartItemState> emit,
  ) async {
    emit(state.copyWith(cartItemState: const CommonState.loading()));

    try {
      final result = await updateCartItem.updateCartItem(
        cartItemId: event.cartItemId,
        quantity: event.quantity,
        isSelected: event.isSelected,
      );

      if (result > 0) {
        final updatedItems = state.cartItems.map((item) {
          if (item.id == event.cartItemId) {
            return item.copyWith(isSelected: event.isSelected);
          }
          return item;
        }).toList();
        emit(
          _recalculate(
            state.copyWith(
              cartItems: updatedItems,
              cartItemState: const CommonState.success(),
            ),
          ),
        );
      } else {
        emit(
          state.copyWith(
            cartItemState: CommonState.error(
              Exception('Không thể cập nhật item'),
            ),
          ),
        );
      }
    } catch (e, st) {
      print('Error in _onChangeIsSelected: $e');
      print(st);
      emit(
        state.copyWith(
          cartItemState: CommonState.error(e.toString() as Exception),
        ),
      );
    }
  }

  void _onSelectAllCartItems(
    SelectAllCartItemsEvent event,
    Emitter<CartItemState> emit,
  ) {
    final targetSelectValue = state.isSelectAll == 1 ? 0 : 1;

    final updated = state.cartItems
        .map((i) => i.copyWith(isSelected: targetSelectValue))
        .toList();

    emit(
      _recalculate(
        state.copyWith(cartItems: updated, isSelectAll: targetSelectValue),
      ),
    );
  }

  Future<void> _onDeleteCartItem(
    DeleteCartItemEvent event,
    Emitter<CartItemState> emit,
  ) async {
    emit(state.copyWith(cartItemState: const CommonState.loading()));
    try {
      final result = await deleteCartItem.deleteCartItem(
        cartItemId: event.cartItemId,
      );

      if (result) {
        final updatedList = state.cartItems
            .where((item) => item.id != event.cartItemId)
            .toList();

        emit(
          _recalculate(
            state.copyWith(
              cartItems: updatedList,
              cartItemState: const CommonState.success(),
            ),
          ),
        );
      } else {
        emit(
          state.copyWith(
            cartItemState: CommonState.error(
              Exception('Xóa sản phẩm thất bại'),
            ),
          ),
        );
      }
    } catch (e, st) {
      print('Error in _onDeleteCartItem: $e');
      print(st);
      emit(
        state.copyWith(
          cartItemState: CommonState.error(e.toString() as Exception),
        ),
      );
    }
  }

  Future<void> _onIncreaseQuantity(
    IncreaseQuantityEvent event,
    Emitter<CartItemState> emit,
  ) async {
    try {
      emit(state.copyWith(cartItemState: const CommonState.loading()));

      final item = state.cartItems.firstWhere((i) => i.id == event.cartItemId);
      final currentQty = item.quantity ?? 0;
      final newQuantity = currentQty + 1;

      final result = await updateCartItem.updateCartItem(
        cartItemId: event.cartItemId,
        quantity: newQuantity,
        isSelected: item.isSelected,
      );

      if (result > 0) {
        final updatedList = state.cartItems.map((i) {
          if (i.id == event.cartItemId) {
            return i.copyWith(quantity: newQuantity);
          }
          return i;
        }).toList();

        emit(
          _recalculate(
            state.copyWith(
              cartItems: updatedList,
              cartItemState: const CommonState.success(),
            ),
          ),
        );
      } else {
        emit(
          state.copyWith(
            cartItemState: CommonState.error(
              Exception("Không thể tăng số lượng"),
            ),
          ),
        );
      }
    } catch (e, st) {
      print(" Error in _onIncreaseQuantity: $e");

      emit(
        state.copyWith(
          cartItemState: CommonState.error(e.toString() as Exception),
        ),
      );
    }
  }

  Future<void> _onDecreaseQuantity(
    DecreaseQuantityEvent event,
    Emitter<CartItemState> emit,
  ) async {
    try {
      emit(state.copyWith(cartItemState: const CommonState.loading()));

      // tìm item trong danh sách
      final item = state.cartItems.firstWhere((i) => i.id == event.cartItemId);

      final currentQty = item.quantity ?? 0;
      if (currentQty <= 1) {
        return;
      }
      final newQuantity = currentQty - 1;
      final result = await updateCartItem.updateCartItem(
        cartItemId: event.cartItemId,
        quantity: newQuantity,
        isSelected: item.isSelected,
      );

      if (result > 0) {
        final updatedList = state.cartItems.map((i) {
          if (i.id == event.cartItemId) {
            return i.copyWith(quantity: newQuantity);
          }
          return i;
        }).toList();

        emit(
          _recalculate(
            state.copyWith(
              cartItems: updatedList,
              cartItemState: const CommonState.success(),
            ),
          ),
        );
      } else {
        emit(
          state.copyWith(
            cartItemState: CommonState.error(
              Exception("Không thể giảm số lượng"),
            ),
          ),
        );
      }
    } catch (e, st) {
      print("Error in _onDecreaseQuantity: $e");
      print(st);

      emit(
        state.copyWith(
          cartItemState: CommonState.error(e.toString() as Exception),
        ),
      );
    }
  }
}
