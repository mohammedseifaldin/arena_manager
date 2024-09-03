import '../../domain/entites/reservation_entity.dart';

class ReservationModel extends ReservationEntity {
  const ReservationModel({
    required super.id,
    required super.clientName,
    required super.startTime,
    required super.endTime,
    required super.deviceId,
  });
}
