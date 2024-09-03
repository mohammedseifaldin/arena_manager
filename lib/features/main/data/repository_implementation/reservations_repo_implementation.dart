import 'package:arena_manager/core/app_localization/app_localization.dart';
import 'package:arena_manager/core/error/failures.dart';
import 'package:arena_manager/core/strings/hive_boxes.dart';
import 'package:arena_manager/features/main/data/hive_helper.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../domain/entites/reservation_entity.dart';
import '../../domain/repository/base_reservations_repo.dart';

class ReservationsRepoImplementation extends BaseReservationsRepo {
  @override
  Future<Either<Failure, String>> addReservation(ReservationEntity newReservation) async {
    try {
      HiveHelper.add(boxName: HiveBoxes.reservationBox, data: newReservation);
      return Right("addingDone".translate());
    } catch (error) {
      return Left(HiveFailure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deleteReservation(ReservationEntity Reservation) async {
    try {
      HiveHelper.remove(boxName: HiveBoxes.reservationBox, data: Reservation);
      return Right("deletingDone".translate());
    } catch (error) {
      return Left(HiveFailure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> editReservation(ReservationEntity Reservation) async {
    try {
      HiveHelper.update(boxName: HiveBoxes.reservationBox, data: Reservation);
      return Right("editingDone".translate());
    } catch (error) {
      return Left(HiveFailure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, ReservationEntity?>> getReservation({required int deviceId}) async {
    try {
      final res = await HiveHelper.getItem(
        deviceId: deviceId,
        boxName: HiveBoxes.reservationBox,
      );

      return Right(res);
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
      return Left(HiveFailure(message: error.toString()));
    }
  }
}
