abstract class SuggestionHistoryEvent {}

class GetSuggestionListEvent extends SuggestionHistoryEvent {
  final String name;
  GetSuggestionListEvent(this.name);
}

class AddSuggestionEvent extends SuggestionHistoryEvent {
  final String keyWord;
  AddSuggestionEvent({required this.keyWord});
}
