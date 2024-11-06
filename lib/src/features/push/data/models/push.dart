import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:push_mvp_app/src/features/push/data/dto/push_dto.dart';

part 'push.g.dart';

@HiveType(typeId: 0)
class Push with EquatableMixin {
  const Push({
    required this.title,
    required this.message,
    this.pushTime,
  });

  factory Push.fromDto(PushDto dto) => Push(
        title: dto.title,
        message: dto.message,
        pushTime: dto.pushTime ?? DateTime.now(),
      );

  @HiveField(0)
  final String title;

  @HiveField(1)
  final String message;

  @HiveField(2)
  final DateTime? pushTime;

  @override
  List<Object?> get props => [
        title,
        message,
        pushTime,
      ];
}
