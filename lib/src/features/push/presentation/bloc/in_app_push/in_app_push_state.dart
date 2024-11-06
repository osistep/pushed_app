import 'package:equatable/equatable.dart';
import 'package:push_mvp_app/src/features/push/data/models/push.dart';

abstract class InAppPushState with EquatableMixin {
  const InAppPushState({
    this.pushes,
  });

  final Push? pushes;

  @override
  List<Object?> get props => [pushes];
}

class EmptyPushState extends InAppPushState {
  const EmptyPushState();
}

class HasPushState extends InAppPushState {
  const HasPushState({super.pushes});

  InAppPushState copyWith({
    Push? pushes,
  }) =>
      HasPushState(
        pushes: pushes ?? this.pushes,
      );
}
