import '../../../domain/entities/products.dart';

abstract class SearchProductIdState {}

class SearchProductIdInitial extends SearchProductIdState {}

class SearchProductIdLoading extends SearchProductIdState {}

class SearchProductIdSuccess extends SearchProductIdState {
  final Product product;
  SearchProductIdSuccess(this.product);
}

class SearchProductIdFailure extends SearchProductIdState {
  final String error;
  SearchProductIdFailure(this.error);
}
