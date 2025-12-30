//freezed
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/full_option.dart';
import '../../core/common_state.dart';

part 'add_product_state.freezed.dart';

@freezed
class AddProductToCartState with _$AddProductToCartState {
  const factory AddProductToCartState({
    @Default([]) List<FullOption> fullOptions,
    @Default({}) Map<int, int> selectedValues,
    double? price,
    int? stock,
    @Default(1) int quantity,

    @Default(CommonState.initial()) CommonState addToCartState,
  }) = _AddProductToCartState;
}

AddProductToCartState initial() => AddProductToCartState();
