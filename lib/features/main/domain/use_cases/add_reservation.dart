import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entites/reservation_entity.dart';
import '../repository/base_reservations_repo.dart';

class AddReservationUseCase {
  final BaseReservationsRepo _repository;

  AddReservationUseCase(this._repository);

  Future<Either<Failure, String>> call(ReservationEntity newReservation) async =>
      await _repository.addReservation(newReservation);
}
