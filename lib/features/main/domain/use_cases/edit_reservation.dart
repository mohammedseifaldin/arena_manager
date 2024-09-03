import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entites/reservation_entity.dart';
import '../repository/base_reservations_repo.dart';

class EditReservationUseCase {
  final BaseReservationsRepo _repository;

  EditReservationUseCase(this._repository);

  Future<Either<Failure, String>> call(ReservationEntity newData) async =>
      await _repository.editReservation(newData);
}
