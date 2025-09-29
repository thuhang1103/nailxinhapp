abstract class StorageSearchHistoryEvent {}

class LoadSearchHistoryEvent extends StorageSearchHistoryEvent {}

class AddSearchKeywordEvent extends StorageSearchHistoryEvent {
  final String keyword;
  AddSearchKeywordEvent(this.keyword);
}

class ClearSearchHistoryEvent extends StorageSearchHistoryEvent {}
