import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entites/device_entity.dart';
import '../repository/base_devices_repo.dart';

class GetDevicesUseCase {
  final BaseDevicesRepo _repository;

  GetDevicesUseCase(this._repository);

  Future<Either<Failure, List<DeviceEntity>>> call() async => await _repository.getDevices();
}
