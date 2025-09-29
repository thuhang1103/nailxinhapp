import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/product_usecase/search_product_usecase.dart';
import '../../evens/product_event/search_product_event.dart';
import '../../states/product_state/search_product_status_state.dart';

class SearchProductStatusBloc
    extends Bloc<SearchProductEvent, SearchProductStatusState> {
  final SearchProductUseCase useCase;

  SearchProductStatusBloc(this.useCase) : super(SearchProductStatusInitial()) {
    on<SearchProductByIdEvent>((event, emit) async {
      emit(SearchProductStatusLoading());
      try {
        final product = await useCase.searchByStatus(event.id);
        emit(SearchProductStatusSuccess(product));
      } catch (e) {
        emit(SearchProductStatusFailure(e.toString()));
      }
    });
  }
}
