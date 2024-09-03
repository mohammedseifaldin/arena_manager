import 'package:get_it/get_it.dart';

import '../../features/main/data/repository_implementation/devices_repo_implementation.dart';
import '../../features/main/data/repository_implementation/reservations_repo_implementation.dart';
import '../../features/main/domain/repository/base_devices_repo.dart';
import '../../features/main/domain/repository/base_reservations_repo.dart';
import '../../features/main/domain/use_cases/add_device.dart';
import '../../features/main/domain/use_cases/add_reservation.dart';
import '../../features/main/domain/use_cases/delete_device.dart';
import '../../features/main/domain/use_cases/delete_reservation.dart';
import '../../features/main/domain/use_cases/edit_device.dart';
import '../../features/main/domain/use_cases/edit_reservation.dart';
import '../../features/main/domain/use_cases/get_devices.dart';
import '../../features/main/domain/use_cases/get_reservation.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    //USE CASES
    sl.registerLazySingleton(() => AddDeviceUseCase(sl()));
    sl.registerLazySingleton(() => GetDevicesUseCase(sl()));
    sl.registerLazySingleton(() => EditDeviceUseCase(sl()));
    sl.registerLazySingleton(() => DeleteDeviceUseCase(sl()));

    sl.registerLazySingleton(() => AddReservationUseCase(sl()));
    sl.registerLazySingleton(() => GetReservationUseCase(sl()));
    sl.registerLazySingleton(() => EditReservationUseCase(sl()));
    sl.registerLazySingleton(() => DeleteReservationUseCase(sl()));

    ///REPOSITORIES
    sl.registerLazySingleton<BaseDevicesRepo>(() => DevicesRepoImplementation());
    sl.registerLazySingleton<BaseReservationsRepo>(() => ReservationsRepoImplementation());
  }
}
