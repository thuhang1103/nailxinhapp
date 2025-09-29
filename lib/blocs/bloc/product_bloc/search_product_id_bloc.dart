import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/product_usecase/search_product_usecase.dart';
import '../../evens/product_event/search_product_event.dart';
import '../../states/product_state/search_product_id_state.dart';

class SearchProductIdBloc
    extends Bloc<SearchProductEvent, SearchProductIdState> {
  final SearchProductUseCase useCase;

  SearchProductIdBloc(this.useCase) : super(SearchProductIdInitial()) {
    on<SearchProductByIdEvent>((event, emit) async {
      emit(SearchProductIdLoading());
      try {
        final product = await useCase.searchById(event.id);
        emit(SearchProductIdSuccess(product));
      } catch (e) {
        emit(SearchProductIdFailure(e.toString()));
      }
    });
  }
}
