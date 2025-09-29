import '../../../domain/entities/products.dart';

abstract class SearchProductNameState {}

class SearchProductNameInitial extends SearchProductNameState {}

class SearchProductNameLoading extends SearchProductNameState {}

class SearchProductNameSuccess extends SearchProductNameState {
  final List<Product> products;
  SearchProductNameSuccess(this.products);
}

class SearchProductNameFailure extends SearchProductNameState {
  final String error;
  SearchProductNameFailure(this.error);
}
