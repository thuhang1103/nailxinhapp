import 'package:bloc/bloc.dart';
import '../../core/common_state.dart';
import '../../core/dependency_injection/service_locator.dart';
import '../../domain/entities/products.dart';
import '../../domain/usecases/product_usecase/search_product_usecase.dart';
import './add_product_event.dart';
import './add_product_state.dart';

class AddProductToCartBloc extends Bloc<CartEvent, AddProductToCartState> {
  final SearchProductUseCase _searchProduct;

  AddProductToCartBloc({SearchProductUseCase? searchProductUseCase})
    : _searchProduct = searchProductUseCase ?? sl<SearchProductUseCase>(),
      super(AddProductToCartState()) {
    on<AddProductToCartEvent>(_onAddProductToCart);
  }

  Future<void> _onAddProductToCart(
    AddProductToCartEvent event,
    Emitter<AddProductToCartState> emit,
  ) async {}
}
