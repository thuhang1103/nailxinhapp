//freezed
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/common_state.dart';
import './../../domain/entities/order/order.dart';
import './../../domain/entities/order/order_detail.dart';

part 'imporrt_state.freezed.dart';

@freezed
class ImportState with _$ImportState {
  const factory ImportState({
    @Default(CommonState.initial()) CommonState importState,
  }) = _ImportState;
}

ImportState initial() => ImportState();
