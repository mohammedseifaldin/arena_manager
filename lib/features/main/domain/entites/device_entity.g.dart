// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DeviceEntityAdapter extends TypeAdapter<DeviceEntity> {
  @override
  final int typeId = 0;

  @override
  DeviceEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DeviceEntity(
      id: fields[0] as int,
      name: fields[1] as String,
      typeName: fields[2] as String,
      avaliable: fields[3] as bool,
      hourPrice: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, DeviceEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.typeName)
      ..writeByte(3)
      ..write(obj.avaliable)
      ..writeByte(4)
      ..write(obj.hourPrice);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeviceEntityAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
