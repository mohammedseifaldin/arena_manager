import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entites/reservation_entity.dart';

abstract class BaseReservationsRepo {
  Future<Either<Failure, String>> addReservation(ReservationEntity newReservation);

  Future<Either<Failure, String>> editReservation(ReservationEntity reservation);

  Future<Either<Failure, String>> deleteReservation(ReservationEntity reservation);

  Future<Either<Failure, ReservationEntity?>> getReservation({required int deviceId});
}
