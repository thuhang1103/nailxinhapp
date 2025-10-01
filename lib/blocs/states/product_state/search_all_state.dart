import '../../../domain/entities/products.dart';

abstract class SearchProductAllState {}

class SearchProductAllInitial extends SearchProductAllState {}

class SearchProductAllLoading extends SearchProductAllState {}

class SearchProductAllSuccess extends SearchProductAllState {
  final List<Product> products;
  SearchProductAllSuccess(this.products);
}

class SearchProductAllFailure extends SearchProductAllState {
  final String error;
  SearchProductAllFailure(this.error);
}
