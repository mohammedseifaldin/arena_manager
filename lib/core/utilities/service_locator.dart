import 'package:get_it/get_it.dart';

import '../../features/main/data/repository_implementation/devices_repo_implementation.dart';
import '../../features/main/domain/repository/base_devices_repo.dart';
import '../../features/main/domain/use_cases/add_device.dart';
import '../../features/main/domain/use_cases/delete_device.dart';
import '../../features/main/domain/use_cases/edit_device.dart';
import '../../features/main/domain/use_cases/get_devices.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    //USE CASES
    sl.registerLazySingleton(() => AddDeviceUseCase(sl()));
    sl.registerLazySingleton(() => GetDevicesUseCase(sl()));
    sl.registerLazySingleton(() => EditDeviceUseCase(sl()));
    sl.registerLazySingleton(() => DeleteDeviceUseCase(sl()));

    ///REPOSITORIES
    sl.registerLazySingleton<BaseDevicesRepo>(() => DevicesRepoImplementation());
  }
}
