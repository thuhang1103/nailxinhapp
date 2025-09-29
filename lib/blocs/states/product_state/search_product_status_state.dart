import '../../../domain/entities/products.dart';

abstract class SearchProductStatusState {}

class SearchProductStatusInitial extends SearchProductStatusState {}

class SearchProductStatusLoading extends SearchProductStatusState {}

class SearchProductStatusSuccess extends SearchProductStatusState {
  final List<Product> products;
  SearchProductStatusSuccess(this.products);
}

class SearchProductStatusFailure extends SearchProductStatusState {
  final String error;
  SearchProductStatusFailure(this.error);
}
