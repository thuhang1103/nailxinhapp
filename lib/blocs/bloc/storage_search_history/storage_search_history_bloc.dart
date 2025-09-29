import 'package:flutter_bloc/flutter_bloc.dart';
import '../../evens/storage_search_history/storage_search_history_event.dart';
import '../../states/storage_search_history/storage_search_history_state.dart';
import '../../../domain/usecases/search_usecases/add_keyword.dart';
import '../../../domain/usecases/search_usecases/getHistoryUsecase.dart';
import '../../../domain/usecases/search_usecases/clear_history_search.dart';

class StorageSearchHistoryBloc
    extends Bloc<StorageSearchHistoryEvent, StorageSearchHistoryState> {
  final AddKeyword addKeywordUsecase;
  final GetSearchHistory getHistoryUsecase;
  final ClearHistorySearch clear;

  StorageSearchHistoryBloc({
    required this.addKeywordUsecase,
    required this.getHistoryUsecase,
    required this.clear,
  }) : super(StorageSearchHistoryInitial()) {
    on<LoadSearchHistoryEvent>((event, emit) async {
      emit(StorageSearchHistoryLoading());
      try {
        print("vào bloc lấy lịch sử tìm kiếm ");
        final history = await getHistoryUsecase.execute();
        emit(StorageSearchHistoryLoaded(history));
        print("Lịch sử tìm kiếm: $history");
      } catch (e) {
        emit(StorageSearchHistoryFailure(e.toString()));
      }
    });

    on<AddSearchKeywordEvent>((event, emit) async {
      emit(StorageSearchHistoryLoading());
      try {
        print("vào bloc thêm từ khóa tìm kiếm: ${event.keyword}");
        await addKeywordUsecase.execute(event.keyword);
        final history = await getHistoryUsecase.execute();
        print("Lịch sử tìm kiếm sau khi thêm: $history");
        emit(StorageSearchHistoryLoaded(history));
      } catch (e) {
        emit(StorageSearchHistoryFailure(e.toString()));
      }
    });

    on<ClearSearchHistoryEvent>((event, emit) async {
      emit(StorageSearchHistoryLoading());
      try {
        // Gọi usecase xóa lịch sử (giả sử bạn có ClearHistoryUsecase)
        await clear.execute();
        emit(StorageSearchHistoryLoaded([]));
      } catch (e) {
        emit(StorageSearchHistoryFailure(e.toString()));
      }
    });
  }
}
