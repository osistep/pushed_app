import 'package:flutter/material.dart';
import 'package:flutter_pushed_messaging/flutter_pushed_messaging.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:push_mvp_app/src/app.dart';
import 'package:push_mvp_app/src/core/background_messaging.dart';
import 'package:push_mvp_app/src/features/push/data/dto/push_dto.dart';
import 'package:push_mvp_app/src/features/push/data/models/push.dart';
import 'package:push_mvp_app/src/features/push/presentation/bloc/in_app_push/in_app_push_bloc.dart';
import 'package:push_mvp_app/src/features/push/presentation/bloc/in_app_push/in_app_push_event.dart';
import 'package:push_mvp_app/src/features/push/presentation/bloc/push/push_bloc.dart';
import 'package:push_mvp_app/src/features/push/presentation/bloc/push/push_event.dart';
import 'package:push_mvp_app/src/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterPushedMessaging.init(backgroundMessage);

  Hive
    ..initFlutter()
    ..registerAdapter<Push>(PushAdapter());

  initializeDependencies();
  await injectionContainer.allReady();

  FlutterPushedMessaging.onMessage().listen((message) async {
    final dto = PushDto.fromJson(message as Map<String, Object?>);
    final push = Push.fromDto(dto);

    injectionContainer.get<InAppPushBloc>().add(ShowPushEvent(push));
    await injectionContainer.getAsync<PushBloc>()
      ..add(SavePushEvent(push))
      ..add(LoadAllPushesEvent());
  });

  runApp(const MyApp());
}
