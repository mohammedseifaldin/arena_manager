import 'package:arena_manager/core/app_localization/app_localization.dart';
import 'package:arena_manager/core/error/failures.dart';
import 'package:arena_manager/core/strings/hive_boxes.dart';
import 'package:arena_manager/features/main/data/hive_helper.dart';
import 'package:arena_manager/features/main/domain/entites/device_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../domain/repository/base_devices_repo.dart';

class DevicesRepoImplementation extends BaseDevicesRepo {
  @override
  Future<Either<Failure, String>> addDevice(DeviceEntity newDevice) async {
    try {
      HiveHelper.add(boxName: HiveBoxes.deviceBox, data: newDevice);
      return Right("addingDone".translate());
    } catch (error) {
      return Left(HiveFailure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deleteDevice(DeviceEntity device) async {
    try {
      HiveHelper.remove(boxName: HiveBoxes.deviceBox, data: device);
      return Right("deletingDone".translate());
    } catch (error) {
      return Left(HiveFailure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> editDevice(DeviceEntity device) async {
    try {
      HiveHelper.update(boxName: HiveBoxes.deviceBox, data: device);
      return Right("editingDone".translate());
    } catch (error) {
      return Left(HiveFailure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DeviceEntity>>> getDevices() async {
    try {
      final res = await HiveHelper.get(boxName: HiveBoxes.deviceBox);

      if ((res is List && res.isEmpty)) {
        return const Right([]);
      }

      return Right(List<DeviceEntity>.from(res));
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
      return Left(HiveFailure(message: error.toString()));
    }
  }
}
