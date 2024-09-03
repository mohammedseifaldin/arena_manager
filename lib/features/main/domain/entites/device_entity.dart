import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'device_entity.g.dart';

@HiveType(typeId: 0)
class DeviceEntity extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String typeName;
  @HiveField(3)
  final bool avaliable;
  @HiveField(4)
  final int hourPrice;

  const DeviceEntity({
    required this.id,
    required this.name,
    required this.typeName,
    required this.avaliable,
    required this.hourPrice,
  });
  @override
  List<Object> get props {
    return [id, name, typeName, avaliable, hourPrice];
  }

  DeviceEntity copyWith({
    int? id,
    String? name,
    String? typeName,
    bool? avaliable,
    int? hourPrice,
  }) {
    return DeviceEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      typeName: typeName ?? this.typeName,
      avaliable: avaliable ?? this.avaliable,
      hourPrice: hourPrice ?? this.hourPrice,
    );
  }
}
