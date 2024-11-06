import 'package:push_mvp_app/src/features/push/data/models/push.dart';

sealed class InAppPushEvent {}

class ShowPushEvent extends InAppPushEvent {
  ShowPushEvent(this.push);

  final Push push;
}

class HidePushEvent extends InAppPushEvent {}
