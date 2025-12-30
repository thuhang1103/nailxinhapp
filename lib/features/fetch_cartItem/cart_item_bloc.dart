import './cart_item_event.dart';
import './cart_item_state.dart';
import 'package:bloc/bloc.dart';
import '../../core/common_state.dart';
import 'dart:async';
//usecase
import '../../domain/usecases/cartItem_usecase/get_all_cartItem_uc.dart';
import '../../domain/usecases/cartItem_usecase/delete_cartItem_usecase.dart';
import '../../domain/usecases/cartItem_usecase/update_cartItem_usecase.dart';

class CartItemBloc extends Bloc<CartItemEvent, CartItemState> {
  final GetAllCartItemUseCase getAll;
  final DeleteCartItemUseCase deleteCartItem;
  final UpdateCartItemUseCase updateCartItem;
  final _uiEventsCtrl = StreamController<String>.broadcast();
  Stream<String> get uiEvents => _uiEventsCtrl.stream;
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
  @override
  Future<void> close() {
    _uiEventsCtrl.close();
    return super.close();
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
      print(' userID: $userID');

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
    try {
      print(
        'ChangeIsSelectedEvent: cartItemId=${event.cartItemId}, variantId=${event.variantId}, quantity=${event.quantity}, isSelected=${event.isSelected}',
      );
      final result = await updateCartItem.updateCartItem(
        cartItemId: event.cartItemId,
        quantity: event.quantity,
        variantId: event.variantId,
        isSelected: event.isSelected,
      );

      if (result > 0) {
        final updatedItems = state.cartItems.map((item) {
          if (item.id == event.cartItemId) {
            return item.copyWith(isSelected: event.isSelected);
          }
          return item;
        }).toList();
        emit(_recalculate(state.copyWith(cartItems: updatedItems)));
      } else {
        _uiEventsCtrl.add('Cập nhật trạng thái chọn thất bại');
      }
    } catch (e, st) {
      print('Error in _onChangeIsSelected: $e');
      print(st);
      _uiEventsCtrl.add('Lỗi khi cập nhật trạng thái chọn');
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
    try {
      final result = await deleteCartItem.deleteCartItem(
        cartItemId: event.cartItemId,
      );

      if (result) {
        final updatedList = state.cartItems
            .where((item) => item.id != event.cartItemId)
            .toList();

        emit(_recalculate(state.copyWith(cartItems: updatedList)));
      } else {
        _uiEventsCtrl.add('Xóa sản phẩm thất bại');
      }
    } catch (e, st) {
      print('Error in _onDeleteCartItem: $e');
      print(st);
      _uiEventsCtrl.add('Lỗi khi xóa sản phẩm');
    }
  }

  Future<void> _onIncreaseQuantity(
    IncreaseQuantityEvent event,
    Emitter<CartItemState> emit,
  ) async {
    try {
      final item = state.cartItems.firstWhere((i) => i.id == event.cartItemId);
      final currentQty = item.quantity ?? 0;
      final newQuantity = currentQty + 1;
      final maxStock = event.stock;
      if (maxStock > 0 && currentQty >= maxStock) {
        _uiEventsCtrl.add('Không thể tăng số lượng, đã đạt giới hạn kho');
        return;
      }

      final result = await updateCartItem.updateCartItem(
        cartItemId: event.cartItemId,
        quantity: newQuantity,
        variantId: item.variantId ?? 0,
        isSelected: item.isSelected,
      );

      if (result > 0) {
        final updatedList = state.cartItems.map((i) {
          if (i.id == event.cartItemId) {
            return i.copyWith(quantity: newQuantity);
          }
          return i;
        }).toList();

        emit(_recalculate(state.copyWith(cartItems: updatedList)));
      } else {
        _uiEventsCtrl.add('Không thể tăng số lượng');
      }
    } catch (e, st) {
      print(" Error in _onIncreaseQuantity: $e");

      _uiEventsCtrl.add('Lỗi khi tăng số lượng');
    }
  }

  Future<void> _onDecreaseQuantity(
    DecreaseQuantityEvent event,
    Emitter<CartItemState> emit,
  ) async {
    try {
      final item = state.cartItems.firstWhere((i) => i.id == event.cartItemId);

      final currentQty = item.quantity ?? 0;
      if (currentQty <= 1) {
        return;
      }
      final newQuantity = currentQty - 1;
      final result = await updateCartItem.updateCartItem(
        cartItemId: event.cartItemId,
        quantity: newQuantity,
        variantId: item.variantId ?? 0,
        isSelected: item.isSelected,
      );

      if (result > 0) {
        final updatedList = state.cartItems.map((i) {
          if (i.id == event.cartItemId) {
            return i.copyWith(quantity: newQuantity);
          }
          return i;
        }).toList();

        emit(_recalculate(state.copyWith(cartItems: updatedList)));
      } else {
        _uiEventsCtrl.add('Không thể giảm số lượng');
      }
    } catch (e, st) {
      print("Error in _onDecreaseQuantity: $e");
      _uiEventsCtrl.add('Lỗi khi giảm số lượng');
    }
  }
}
