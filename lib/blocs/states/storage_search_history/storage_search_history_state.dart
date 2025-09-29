abstract class StorageSearchHistoryState {}

class StorageSearchHistoryInitial extends StorageSearchHistoryState {}

class StorageSearchHistoryLoading extends StorageSearchHistoryState {}

class StorageSearchHistoryLoaded extends StorageSearchHistoryState {
  final List<String> history;
  StorageSearchHistoryLoaded(this.history);
}

class StorageSearchHistoryFailure extends StorageSearchHistoryState {
  final String error;
  StorageSearchHistoryFailure(this.error);
}
