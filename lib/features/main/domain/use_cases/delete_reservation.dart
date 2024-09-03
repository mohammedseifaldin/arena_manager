import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entites/reservation_entity.dart';
import '../repository/base_reservations_repo.dart';

class DeleteReservationUseCase {
  final BaseReservationsRepo _repository;

  DeleteReservationUseCase(this._repository);

  Future<Either<Failure, String>> call({required ReservationEntity reservation}) async =>
      await _repository.deleteReservation(reservation);
}
