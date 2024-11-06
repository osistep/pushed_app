import 'package:equatable/equatable.dart';
import 'package:push_mvp_app/src/features/push/data/models/push.dart';

abstract class PushState with EquatableMixin {
  const PushState({
    this.pushes = const [],
  });

  final List<Push> pushes;

  @override
  List<Object?> get props => [pushes];
}

class PushLoadingState extends PushState {
  const PushLoadingState();
}

class PushLoadingDoneState extends PushState {
  const PushLoadingDoneState({super.pushes});

  PushState copyWith({
    List<Push>? pushes,
  }) =>
      PushLoadingDoneState(
        pushes: pushes ?? this.pushes,
      );
}
