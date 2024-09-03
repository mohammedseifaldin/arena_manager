// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReservationEntityAdapter extends TypeAdapter<ReservationEntity> {
  @override
  final int typeId = 0;

  @override
  ReservationEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReservationEntity(
      id: fields[0] as int,
      clientName: fields[1] as String,
      startTime: fields[2] as TimeOfDay,
      endTime: fields[3] as TimeOfDay,
      deviceId: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ReservationEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.clientName)
      ..writeByte(2)
      ..write(obj.startTime)
      ..writeByte(3)
      ..write(obj.endTime)
      ..writeByte(4)
      ..write(obj.deviceId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReservationEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
