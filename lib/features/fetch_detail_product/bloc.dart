import 'package:bloc/bloc.dart';
import '../../core/common_state.dart';
import '../../core/dependency_injection/service_locator.dart';
import '../../domain/entities/products.dart';
import '../../domain/usecases/product_usecase/search_product_usecase.dart';
import './event.dart';
import './state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, FetchProductState> {
  final SearchProductUseCase _searchProduct;

  ProductDetailBloc({SearchProductUseCase? searchProductUseCase})
    : _searchProduct = searchProductUseCase ?? sl<SearchProductUseCase>(),
      super(FetchProductState()) {
    on<FetchProductDetail>(_onFetchProductDetail);
  }

  Future<void> _onFetchProductDetail(
    FetchProductDetail event,
    Emitter<FetchProductState> emit,
  ) async {
    final id = event.productId;
    if (id == null) {
      emit(
        state.copyWith(
          state: CommonState.error(Exception('Invalid product id')),
          product: null,
        ),
      );
      return;
    }

    emit(state.copyWith(state: CommonState.loading(), product: null));

    try {
      print("vào bloc ");
      final Product product = await _searchProduct.searchById(id);
      emit(state.copyWith(state: CommonState.success(), product: product));
      print("Đã lấy chi tiết sản phẩm ở bloc : ${product.productName}");
    } catch (e) {
      emit(
        state.copyWith(
          state: CommonState.error(Exception(e.toString())),
          product: null,
        ),
      );
    }
  }
}
