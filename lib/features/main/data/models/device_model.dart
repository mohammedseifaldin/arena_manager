import '../../domain/entites/device_entity.dart';

class DeviceModel extends DeviceEntity {
  const DeviceModel({
    required super.id,
    required super.name,
    required super.typeName,
    required super.avaliable,
    required super.hourPrice,
  });
}
