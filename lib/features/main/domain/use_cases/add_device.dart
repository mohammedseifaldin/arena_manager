import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entites/device_entity.dart';
import '../repository/base_devices_repo.dart';

class AddDeviceUseCase {
  final BaseDevicesRepo _repository;

  AddDeviceUseCase(this._repository);

  Future<Either<Failure, String>> call(DeviceEntity newSection) async =>
      await _repository.addDevice(newSection);
}
