import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/product_usecase/search_product_usecase.dart';
import '../../evens/product_event/search_product_event.dart';
import '../../states/product_state/search_all_state.dart';

class SearchProductAllBloc
    extends Bloc<SearchProductEvent, SearchProductAllState> {
  final SearchProductUseCase useCase;

  SearchProductAllBloc(this.useCase) : super(SearchProductAllInitial()) {
    on<GetAllProductsEvent>((event, emit) async {
      emit(SearchProductAllLoading());
      try {
        final products = await useCase.getAllSimilarProducts();
        emit(SearchProductAllSuccess(products));
      } catch (e) {
        emit(SearchProductAllFailure(e.toString()));
      }
    });
  }
}
