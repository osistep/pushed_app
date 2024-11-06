import 'package:hive/hive.dart';
import 'package:push_mvp_app/src/features/push/data/models/push.dart';

abstract interface class PushRepository {
  Future<void> savePush(Push push);

  Future<List<Push>> loadAllPushes();
}

class PushRepositoryImpl implements PushRepository {
  PushRepositoryImpl(this._box);

  final Box<Push> _box;

  @override
  Future<void> savePush(Push push) => _box.add(push);

  @override
  Future<List<Push>> loadAllPushes() async {
    final List<Push> pushes = [];
    for (int i = 0; i < _box.values.length - 1; i++) {
      final push = _box.getAt(i);
      if (push != null) {
        pushes.add(push);
      }
    }

    return pushes;
  }
}
