import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entites/device_entity.dart';

abstract class BaseDevicesRepo {
  Future<Either<Failure, String>> addDevice(DeviceEntity newDevice);

  Future<Either<Failure, String>> editDevice(DeviceEntity device);

  Future<Either<Failure, String>> deleteDevice(DeviceEntity device);

  Future<Either<Failure, List<DeviceEntity>>> getDevices();
}
