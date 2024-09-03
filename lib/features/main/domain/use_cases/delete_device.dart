import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entites/device_entity.dart';
import '../repository/base_devices_repo.dart';

class DeleteDeviceUseCase {
  final BaseDevicesRepo _repository;

  DeleteDeviceUseCase(this._repository);

  Future<Either<Failure, String>> call({required DeviceEntity device}) async =>
      await _repository.deleteDevice(device);
}
