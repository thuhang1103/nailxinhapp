abstract class SearchProductEvent {}

class SearchProductByNameEvent extends SearchProductEvent {
  final String name;

  SearchProductByNameEvent(this.name);
}

class SearchProductByCategoryEvent extends SearchProductEvent {
  final int categoryId;

  SearchProductByCategoryEvent(this.categoryId);
}

class SearchProductByIdEvent extends SearchProductEvent {
  final int id;

  SearchProductByIdEvent(this.id);
}

class SearchProductByStatusEvent extends SearchProductEvent {
  final int status;

  SearchProductByStatusEvent(this.status);
}

class GetAllProductsEvent extends SearchProductEvent {}
