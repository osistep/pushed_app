// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PushAdapter extends TypeAdapter<Push> {
  @override
  final int typeId = 0;

  @override
  Push read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Push(
      title: fields[0] as String,
      message: fields[1] as String,
      pushTime: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Push obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.pushTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PushAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
