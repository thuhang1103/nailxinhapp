//freezed
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/products.dart';
import '../../core/common_state.dart';

part 'state.freezed.dart';

@freezed
class FetchProductState with _$FetchProductState {
  const factory FetchProductState({
    @Default(CommonState1.initial()) CommonState1 state,
    Product? product,
  }) = _FetchProductState;
}

FetchProductState initial() => FetchProductState();
