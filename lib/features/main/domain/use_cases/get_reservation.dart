import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entites/reservation_entity.dart';
import '../repository/base_reservations_repo.dart';

class GetReservationUseCase {
  final BaseReservationsRepo _repository;

  GetReservationUseCase(this._repository);

  Future<Either<Failure, ReservationEntity?>> call({required int deviceId}) async {
    return await _repository.getReservation(deviceId: deviceId);
  }
}
