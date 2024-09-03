import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/app_styles/app_colors.dart';
import '../../../domain/entites/device_entity.dart';
import '../controller/main_cubit.dart';
import 'add_device_dialoge.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    final mainCubit = context.read<MainCubit>();
    return FloatingActionButton(
      backgroundColor: AppColors.kPrimaryColor,
      onPressed: () async {
        final res = await showModalBottomSheet(
          context: context,
          showDragHandle: true,
          isScrollControlled: true,
          builder: (BuildContext context) {
            final id = mainCubit.devices.isEmpty ? 1 : mainCubit.devices.last.id + 1;
            return AddDeviceDialoge(
              id: id,
            );
          },
        );
        if (res is DeviceEntity) {
          mainCubit.addDevice(res);
        }
      },
      child: const Icon(Icons.add),
    );
  }
}
