import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:push_mvp_app/src/features/push/data/dto/push_dto.dart';
import 'package:push_mvp_app/src/features/push/data/models/push.dart';
import 'package:push_mvp_app/src/features/push/presentation/bloc/push/push_bloc.dart';
import 'package:push_mvp_app/src/features/push/presentation/bloc/push/push_event.dart';
import 'package:push_mvp_app/src/injection_container.dart';

@pragma('vm:entry-point')
Future<void> backgroundMessage(Map<dynamic, dynamic> message) async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    final dto = PushDto.fromJson(message as Map<String, Object?>);
    await injectionContainer.getAsync<PushBloc>()
      ..add(SavePushEvent(Push.fromDto(dto)))
      ..add(LoadAllPushesEvent());
    if (dto.title != '' || dto.message != '') {
      await flutterLocalNotificationsPlugin.show(
        8888,
        dto.title,
        dto.message,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'push_mvp_app_channel',
            'A MVP app push channel',
            importance: Importance.max,
            priority: Priority.high,
            visibility: NotificationVisibility.public,
            enableLights: true,
          ),
        ),
      );
    }
  }
}
