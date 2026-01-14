import 'package:flutter_bloc/flutter_bloc.dart';

//common state
import '../../core/common_state.dart';
import '../../../core/appException.dart';
import './import_event.dart';
import './imporrt_state.dart';
import '../../domain/usecases/import_usecase.dart';

class ImportBloc extends Bloc<ManageImportEvent, ImportState> {
  final ImportUseCase importUseCase;

  ImportBloc({required this.importUseCase}) : super(initial()) {
    // register handlers
    on<CreateImportEvent>(_onCreateImport);
  }

  Future<void> _onCreateImport(
    CreateImportEvent event,
    Emitter<ImportState> emit,
  ) async {
    emit(state.copyWith(importState: const CommonState.loading()));

    try {
      await importUseCase.createImport(
        note: event.note,
        totalAmount: event.totalAmount,
        createdAt: event.createdAt,
      );
      print('Import created successfully');
      emit(state.copyWith(importState: const CommonState.success()));
    } catch (e) {
      emit(
        state.copyWith(
          importState: CommonState.error(BusinessException(e.toString())),
        ),
      );
    }
  }
}
