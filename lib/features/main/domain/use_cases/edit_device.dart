import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entites/device_entity.dart';
import '../repository/base_devices_repo.dart';

class EditDeviceUseCase {
  final BaseDevicesRepo _repository;

  EditDeviceUseCase(this._repository);

  Future<Either<Failure, String>> call(DeviceEntity newData) async =>
      await _repository.editDevice(newData);
}
