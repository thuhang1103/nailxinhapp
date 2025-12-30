import 'package:flutter_bloc/flutter_bloc.dart';
import 'add_product_event.dart';
import 'add_product_state.dart';
import '../../../domain/usecases/cartItem_usecase/option_value_usecase.dart';
import '../../../domain/usecases/cartItem_usecase/add_cartItem_usecase.dart';
import '../../../domain/usecases/cartItem_usecase/get_all_cartItem_uc.dart';
import '../add_product_inCart/add_product_event.dart';
import '../add_product_inCart/add_product_state.dart';

//common state
import '../../core/common_state.dart';
import '../../../core/appException.dart';
import 'package:dio/dio.dart';

class AddProductToCartBloc extends Bloc<CartEvent, AddProductToCartState> {
  final OptionValueUseCase getFullOptions;
  final CreateCartItemUseCase addToCart;
  final GetAllCartItemUseCase getAll;

  AddProductToCartBloc({
    required this.getFullOptions,
    required this.addToCart,
    required this.getAll,
  }) : super(initial()) {
    // register handlers
    on<LoadFullOptions>(_onLoadFullOptions);
    on<SelectValue>(_onSelectValue);
    on<ChangeQuantity>(_onChangeQuantity);
    on<AddToCart>(_onAddToCart);
    on<ResetState>((event, emit) {
      emit(state.copyWith(addToCartState: const CommonState.initial()));
    });
  }

  Future<void> _onLoadFullOptions(
    LoadFullOptions event,
    Emitter<AddProductToCartState> emit,
  ) async {
    try {
      final fullOptions = await getFullOptions.getFullOptions(
        productID: event.productId,
      );

      emit(state.copyWith(fullOptions: fullOptions));
    } catch (e) {
      emit(state.copyWith(fullOptions: []));
    }
  }

  void _onSelectValue(SelectValue event, Emitter<AddProductToCartState> emit) {
    final newSelected = Map<int, int>.from(state.selectedValues);
    newSelected[event.optionId] = event.valueID;

    emit(state.copyWith(selectedValues: newSelected));
  }

  void _onChangeQuantity(
    ChangeQuantity event,
    Emitter<AddProductToCartState> emit,
  ) {
    emit(state.copyWith(quantity: event.quantity));
  }

  Future<void> _onAddToCart(
    AddToCart event,
    Emitter<AddProductToCartState> emit,
  ) async {
    emit(state.copyWith(addToCartState: const CommonState.loading()));

    try {
      if (state.fullOptions.length != state.selectedValues.length) {
        emit(
          state.copyWith(
            addToCartState: const CommonState.error(
              const BusinessException(
                'Vui lòng chọn đầy đủ các thuộc tính sản phẩm',
              ),
            ),
          ),
        );
        return;
      }

      // Lấy VariantID từ backend
      final variantId = await getFullOptions.getProductVariantID(
        selectedValues: state.selectedValues,
      );
      final userID = await getAll.getUserID();
      final exists = await addToCart.checkCartItemExists(
        userId: userID,
        variantId: variantId,
        quantity: state.quantity,
      );

      if (exists == 1) {
        emit(state.copyWith(addToCartState: const CommonState.success()));
        return;
      } else {
        print('Thêm sản phẩm vào giỏ hàng');
        await addToCart.createCartItem(
          userId: userID,
          productId: event.productId,
          variantId: variantId,
          quantity: state.quantity,
          price: state.price ?? 0.0,
        );
        emit(state.copyWith(addToCartState: const CommonState.success()));
      }
    } catch (e) {
      String errorMessage;

      if (e is AppException) {
        errorMessage = e.toString();
      } else if (e is DioException) {
        errorMessage = e.message ?? 'Lỗi kết nối';
      } else {
        errorMessage = e.toString();
      }

      emit(
        state.copyWith(
          addToCartState: CommonState.error(
            BusinessException(errorMessage), // hoặc Exception(errorMessage)
          ),
        ),
      );
    }
  }
}
