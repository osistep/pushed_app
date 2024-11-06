import 'package:push_mvp_app/src/core/use_case.dart';
import 'package:push_mvp_app/src/features/push/data/models/push.dart';
import 'package:push_mvp_app/src/features/push/domain/repository/push_repository.dart';

class LoadAllPushesUseCase implements UseCase<List<Push>, void> {
  const LoadAllPushesUseCase(this._pushRepository);

  final PushRepository _pushRepository;

  @override
  Future<List<Push>> call([void params]) async => _pushRepository.loadAllPushes();
}
