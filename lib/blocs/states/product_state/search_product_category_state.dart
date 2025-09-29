import '../../../domain/entities/products.dart';

abstract class SearchProductCategoryState {}

class SearchProductCategoryInitial extends SearchProductCategoryState {}

class SearchProductCategoryLoading extends SearchProductCategoryState {}

class SearchProductCategorySuccess extends SearchProductCategoryState {
  final List<Product> products;
  SearchProductCategorySuccess(this.products);
}

class SearchProductCategoryFailure extends SearchProductCategoryState {
  final String error;
  SearchProductCategoryFailure(this.error);
}
