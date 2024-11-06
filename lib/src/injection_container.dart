import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:push_mvp_app/src/features/push/domain/repository/push_repository.dart';
import 'package:push_mvp_app/src/features/push/domain/use_cases/load_all_pushes.dart';
import 'package:push_mvp_app/src/features/push/domain/use_cases/save_push.dart';
import 'package:push_mvp_app/src/features/push/presentation/bloc/in_app_push/in_app_push_bloc.dart';
import 'package:push_mvp_app/src/features/push/presentation/bloc/push/push_bloc.dart';

final injectionContainer = GetIt.instance;

void initializeDependencies() {
  // Repository
  injectionContainer.registerLazySingletonAsync<PushRepository>(
    () async => PushRepositoryImpl(await Hive.openBox('push')),
  );

  // Use cases
  injectionContainer.registerLazySingletonAsync(
    () async => SavePushUseCase(await injectionContainer.getAsync<PushRepository>()),
  );
  injectionContainer.registerLazySingletonAsync(
    () async => LoadAllPushesUseCase(await injectionContainer.getAsync<PushRepository>()),
  );

  // Blocs
  injectionContainer.registerFactoryAsync(
    () async => PushBloc(
      await injectionContainer.getAsync<SavePushUseCase>(),
      await injectionContainer.getAsync<LoadAllPushesUseCase>(),
    ),
  );
  injectionContainer.registerFactory(() => InAppPushBloc());
}
