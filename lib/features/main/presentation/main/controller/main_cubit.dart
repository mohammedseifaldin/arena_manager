import 'package:arena_manager/core/enums.dart';
import 'package:arena_manager/features/main/domain/use_cases/add_device.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utilities/service_locator.dart';
import '../../../domain/entites/device_entity.dart';
import '../../../domain/use_cases/delete_device.dart';
import '../../../domain/use_cases/edit_device.dart';
import '../../../domain/use_cases/get_devices.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  List<DeviceEntity> devices = [];
  MainCubit() : super(MainInitial());

  Future getData() async {
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

  void updateDevice(DeviceEntity device) async {
    emit(AddingDevice(processState: ProcessState.processing));

    final reqResult = await sl<EditDeviceUseCase>().call(device);
    reqResult.fold(
      (l) => emit(AddingDevice(processState: ProcessState.failed, result: l.message ?? "")),
      (r) {
        for (int i = 0; i < devices.length; i++) {
          if (devices[i].id == device.id) {
            devices[i] = device;
            break;
          }
        }
        emit(GettingDevicessDone());
      },
    );
  }

  Future<bool> deleteDevice(DeviceEntity device) async {
    bool done = false;
    emit(DeleteingDevice(processState: ProcessState.processing));
    final reqResult = await sl<DeleteDeviceUseCase>().call(device: device);
    reqResult.fold(
      (l) => emit(DeleteingDevice(processState: ProcessState.failed, result: l.message ?? "")),
      (r) {
        // final int index = devices.indexOf(device);
        devices.remove(device);
        emit(GettingDevicessDone());
        done = true;
      },
    );
    return done;
  }
}
