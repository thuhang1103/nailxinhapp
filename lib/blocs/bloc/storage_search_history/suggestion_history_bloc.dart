import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/search_usecases/search_suggestion_usecase.dart';
import '../../evens/storage_search_history/suggestion_history_event.dart';
import '../../states/storage_search_history/suggestion_history_state.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// Bloc
class SuggestionHistoryBloc
    extends Bloc<SuggestionHistoryEvent, SuggestionHistoryState> {
  final SearchSuggestionUseCase useCase;
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  SuggestionHistoryBloc(this.useCase) : super(SuggestionHistoryInitial()) {
    on<GetSuggestionListEvent>((event, emit) async {
      emit(SuggestionHistoryLoading());
      try {
        print("vào bloc lấy gợi ý tìm kiếm: ${event.name}");
        final suggestions = await useCase.execute(event.name);
        print("Gợi ý tìm kiếm: $suggestions");
        emit(SuggestionHistoryLoaded(suggestions));
      } catch (e) {
        emit(SuggestionHistoryFailure(e.toString()));
      }
    });

    on<AddSuggestionEvent>((event, emit) async {
      emit(SuggestionHistoryLoading());
      try {
        print("vào bloc thêm gợi ý tìm kiếm: ${event.keyWord}");
        final Token = await storage.read(key: "refreshToken");
        await useCase.addSuggestion(
          refreshToken: Token,
          keyWord: event.keyWord,
        );
        print("Thêm gợi ý tìm kiếm thành công");
        emit(SuggestionHistoryAdded());
      } catch (e) {
        emit(SuggestionHistoryFailure(e.toString()));
      }
    });
  }
}
