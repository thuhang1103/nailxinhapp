//freezed
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/full_option.dart';
import '../../core/common_state.dart';
import '../../../domain/entities/point.dart';

part 'getPoint_state.freezed.dart';

@freezed
class GetPointState with _$GetPointState {
  const factory GetPointState({
    @Default(0) int point,
    @Default('hạng đồng') String? membershipLevel,
    @Default(1) int canClaimToday,
    @Default(false) bool canSpin,
    final int? lastSpinResult,

    @Default(CommonState.initial()) CommonState pointState,
  }) = _GetPointState;
}
