import 'package:bloc/bloc.dart';
import '../../core/common_state.dart';
import '../../core/dependency_injection/service_locator.dart';
import '../../domain/entities/products.dart';
import '../../domain/entities/product_detail.dart';
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
    emit(state.copyWith(productState: CommonState.loading(), product: null));

    try {
      final ProductDetail product = await _searchProduct.searchById(
        event.productId,
      );
      emit(
        state.copyWith(productState: CommonState.success(), product: product),
      );
    } catch (e) {
      emit(
        state.copyWith(
          productState: CommonState.error(Exception(e.toString())),
          product: null,
        ),
      );
    }
  }
}
