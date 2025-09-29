abstract class SuggestionHistoryState {}

class SuggestionHistoryInitial extends SuggestionHistoryState {}

class SuggestionHistoryLoading extends SuggestionHistoryState {}

class SuggestionHistoryLoaded extends SuggestionHistoryState {
  final List<String> suggestions;
  SuggestionHistoryLoaded(this.suggestions);
}

class SuggestionHistoryAdded extends SuggestionHistoryState {}

class SuggestionHistoryFailure extends SuggestionHistoryState {
  final String error;
  SuggestionHistoryFailure(this.error);
}
