import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push_mvp_app/src/features/push/presentation/bloc/in_app_push/in_app_push_event.dart';
import 'package:push_mvp_app/src/features/push/presentation/bloc/in_app_push/in_app_push_state.dart';

class InAppPushBloc extends Bloc<InAppPushEvent, InAppPushState> {
  InAppPushBloc() : super(const EmptyPushState()) {
    on<ShowPushEvent>(_onSavePush);
    on<HidePushEvent>(_onLoadPushes);
  }

  Future<void> _onSavePush(ShowPushEvent event, Emitter<InAppPushState> emit) async {
    emit((state as HasPushState).copyWith(pushes: event.push));
  }

  Future<void> _onLoadPushes(HidePushEvent event, Emitter<InAppPushState> emit) async {
    emit(state as EmptyPushState);
  }
}
