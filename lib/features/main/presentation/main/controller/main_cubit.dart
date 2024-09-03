import 'package:arena_manager/core/enums.dart';
import 'package:arena_manager/features/main/domain/use_cases/add_device.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utilities/service_locator.dart';
import '../../../domain/entites/device_entity.dart';
import '../../../domain/use_cases/get_devices.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  List<DeviceEntity> devices = [];
  MainCubit() : super(MainInitial());

  void getData() async {
    emit(GettingDevicess());
    final reqResult = await sl<GetDevicesUseCase>().call();
    reqResult.fold(
      (l) => emit(GettingDevicessFailed(errorMessage: l.message)),
      (r) {
        devices = r;
        emit(GettingDevicessDone());
      },
    );
  }

  void addDevice(DeviceEntity device) async {
    emit(AddingDevice(processState: ProcessState.processing));
    final reqResult = await sl<AddDeviceUseCase>().call(device);
    reqResult.fold(
      (l) => emit(AddingDevice(processState: ProcessState.failed, result: l.message ?? "")),
      (r) {
        devices = [...devices, device];
        emit(GettingDevicessDone());
      },
    );
  }
}
