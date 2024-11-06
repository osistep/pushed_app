import 'package:push_mvp_app/src/core/use_case.dart';
import 'package:push_mvp_app/src/features/push/data/models/push.dart';
import 'package:push_mvp_app/src/features/push/domain/repository/push_repository.dart';

class SavePushUseCase implements UseCase<void, Push> {
  const SavePushUseCase(this._pushRepository);

  final PushRepository _pushRepository;

  @override
  Future<void> call([Push? params]) => _pushRepository.savePush(params!);
}
