import 'package:push_mvp_app/src/features/push/data/models/push.dart';

sealed class PushEvent {}

class SavePushEvent extends PushEvent {
  SavePushEvent(this.push);

  final Push push;
}

class LoadAllPushesEvent extends PushEvent {
  LoadAllPushesEvent();
}
