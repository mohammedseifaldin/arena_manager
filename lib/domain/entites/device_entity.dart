import 'package:arena_manager/core/enums.dart';

class DeviceEntity {
  final int id;
  final String name;
  final PlayingDevices type;
  final bool status;

  DeviceEntity({required this.id, required this.name, required this.type, required this.status});
}
