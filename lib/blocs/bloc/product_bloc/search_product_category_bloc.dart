import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/product_usecase/search_product_usecase.dart';
import '../../evens/product_event/search_product_event.dart';
import '../../states/product_state/search_product_category_state.dart';

class SearchProductCategoryBloc
    extends Bloc<SearchProductEvent, SearchProductCategoryState> {
  final SearchProductUseCase useCase;

  SearchProductCategoryBloc(this.useCase)
    : super(SearchProductCategoryInitial()) {
    on<SearchProductByCategoryEvent>((event, emit) async {
      emit(SearchProductCategoryLoading());
      try {
        final products = await useCase.searchByCategory(event.categoryId);
        emit(SearchProductCategorySuccess(products));
      } catch (e) {
        emit(SearchProductCategoryFailure(e.toString()));
      }
    });
  }
}
