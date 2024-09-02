import 'package:arena_manager/core/enums.dart';

class DeviceEntity {
  final int id;
  final String name;
  final PlayingDevices type;
  final bool status;
  final int hourPrice;

  DeviceEntity({
    required this.id,
    required this.name,
    required this.type,
    required this.status,
    required this.hourPrice,
  });
}
