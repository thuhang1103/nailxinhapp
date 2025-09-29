import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/product_usecase/search_product_usecase.dart';
import '../../evens/product_event/search_product_event.dart';
import '../../states/product_state/search_product_name_state.dart';

class SearchProductNameBloc
    extends Bloc<SearchProductEvent, SearchProductNameState> {
  final SearchProductUseCase useCase;

  SearchProductNameBloc(this.useCase) : super(SearchProductNameInitial()) {
    on<SearchProductByNameEvent>((event, emit) async {
      emit(SearchProductNameLoading());
      try {
        print("vào bloc tìm kiếm sản phẩm");
        final products = await useCase.searchByName(event.name);
        emit(SearchProductNameSuccess(products));
      } catch (e) {
        emit(SearchProductNameFailure(e.toString()));
      }
    });
  }
}
