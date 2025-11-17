import '../../../domain/entities/products.dart';
import '../../../domain/entities/product_detail.dart';

abstract class SearchProductIdState {}

class SearchProductIdInitial extends SearchProductIdState {}

class SearchProductIdLoading extends SearchProductIdState {}

class SearchProductIdSuccess extends SearchProductIdState {
  final ProductDetail product;
  SearchProductIdSuccess(this.product);
}

class SearchProductIdFailure extends SearchProductIdState {
  final String error;
  SearchProductIdFailure(this.error);
}
