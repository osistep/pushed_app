import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push_mvp_app/src/features/push/data/models/push.dart';
import 'package:push_mvp_app/src/features/push/domain/use_cases/load_all_pushes.dart';
import 'package:push_mvp_app/src/features/push/domain/use_cases/save_push.dart';
import 'package:push_mvp_app/src/features/push/presentation/bloc/push/push_event.dart';
import 'package:push_mvp_app/src/features/push/presentation/bloc/push/push_state.dart';

class PushBloc extends Bloc<PushEvent, PushState> {
  PushBloc(this._savePushUseCase, this._loadAllPushesUseCase) : super(const PushLoadingState()) {
    on<SavePushEvent>(_onSavePush);
    on<LoadAllPushesEvent>(_onLoadPushes);
  }

  final SavePushUseCase _savePushUseCase;
  final LoadAllPushesUseCase _loadAllPushesUseCase;

  Future<void> _onSavePush(SavePushEvent event, Emitter<PushState> emit) async {
    final push = event.push;
    await _savePushUseCase(push);
    final pushes = List<Push>.from(state.pushes)..add(push);
    emit((state as PushLoadingDoneState).copyWith(pushes: pushes));
  }

  Future<void> _onLoadPushes(LoadAllPushesEvent event, Emitter<PushState> emit) async {
    final pushes = await _loadAllPushesUseCase();
    emit(PushLoadingDoneState(pushes: pushes));
  }
}
