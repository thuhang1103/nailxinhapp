import '../../domain/usecases/point_usecase.dart';
import 'package:bloc/bloc.dart';
import 'getPoint_event.dart';
import 'getPoint_state.dart';
import '../../core/common_state.dart';
import '../../../core/appException.dart';
import 'dart:async';
//helper

import '../../core/helper.dart';

class GetPointBloc extends Bloc<PointEvent, GetPointState> {
  final PointUseCase pointUseCase;
  final _uiEventsCtrl = StreamController<String>.broadcast();
  Stream<String> get uiEvents => _uiEventsCtrl.stream;

  GetPointBloc({required this.pointUseCase}) : super(const GetPointState()) {
    // register handlers
    on<LoadPointData>(_onLoadPointData);
    on<ReceiveDailyPoints>(_onReceiveDailyPoints);
    on<SpinLuckyWheel>(_onSpinLuckyWheel);
    on<ClearSpinResult>((event, emit) {
      emit(state.copyWith(lastSpinResult: null));
    });
  }
  @override
  Future<void> close() {
    _uiEventsCtrl.close();
    return super.close();
  }

  Future<void> _onLoadPointData(
    LoadPointData event,
    Emitter<GetPointState> emit,
  ) async {
    emit(state.copyWith(pointState: const CommonState.loading()));

    try {
      final getpoint = await pointUseCase.getLoyaltyPoints();
      final level = await pointUseCase.getMembershipLevel();
      final levelVi = mapMembershipLevel(level);
      final canClaimToday = await pointUseCase.getPointsStatus();
      final canSpin = await pointUseCase.checkCanSpinToday();
      print(
        'Loaded point data: $getpoint, level: $level, canClaimToday: $canClaimToday, canSpin: $canSpin',
      );
      final int point = getpoint.loyaltyPoints ?? 0;
      print('Loyalty points: $point');

      emit(
        state.copyWith(
          point: point,
          membershipLevel: level,
          canClaimToday: canClaimToday,
          canSpin: canSpin,
          pointState: const CommonState.success(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          pointState: CommonState.error(BusinessException(e.toString())),
        ),
      );
    }
  }

  Future<void> _onReceiveDailyPoints(
    ReceiveDailyPoints event,
    Emitter<GetPointState> emit,
  ) async {
    try {
      await pointUseCase.addPointsDaily();
      final updatedPoint = await pointUseCase.getLoyaltyPoints();

      emit(
        state.copyWith(
          point: updatedPoint.loyaltyPoints ?? 0,
          canClaimToday: 0,
        ),
      );
    } catch (e) {
      print('Error in _onChangeIsSelected: $e');
      _uiEventsCtrl.add('Lỗi khi lấy điểm hàng ngày $e');
    }
  }

  Future<void> _onSpinLuckyWheel(
    SpinLuckyWheel event,
    Emitter<GetPointState> emit,
  ) async {
    try {
      final result = await pointUseCase.spinLucky();
      final point = await pointUseCase.getLoyaltyPoints();
      final canSpin = await pointUseCase.checkCanSpinToday();
      print(' Can spin bloc: $canSpin');

      emit(
        state.copyWith(
          lastSpinResult: result,
          point: point.loyaltyPoints ?? 0,
          canSpin: false,
        ),
      );
    } catch (e) {
      print('Error in _onChangeIsSelected: $e');
      _uiEventsCtrl.add('Lỗi khi quay số may mắn $e');
    }
  }
}
