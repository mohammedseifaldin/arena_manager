import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'reservation_entity.g.dart';

@HiveType(typeId: 0)
class ReservationEntity extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String clientName;
  @HiveField(2)
  final TimeOfDay startTime;
  @HiveField(3)
  final TimeOfDay endTime;
  @HiveField(4)
  final int deviceId;

  const ReservationEntity({
    required this.id,
    required this.clientName,
    required this.startTime,
    required this.endTime,
    required this.deviceId,
  });
  @override
  List<Object> get props {
    return [id, clientName, startTime, endTime, deviceId];
  }

  ReservationEntity copyWith({
    int? id,
    String? clientName,
    TimeOfDay? startTime,
    TimeOfDay? endTime,
    int? deviceId,
  }) {
    return ReservationEntity(
      id: id ?? this.id,
      clientName: clientName ?? this.clientName,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      deviceId: deviceId ?? this.deviceId,
    );
  }
}
