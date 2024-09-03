import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entites/device_entity.dart';
import '../controller/main_cubit.dart';
import 'add_device_dialoge.dart';
import 'device_card_body.dart';

class DeviceCardDismissible extends StatelessWidget {
  final DeviceEntity device;

  const DeviceCardDismissible({super.key, required this.device});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MainCubit>();
    final phoneIsLTR = Directionality.of(context) == TextDirection.ltr;
    return Dismissible(
      key: Key("${device.id}"),
      background: CardBackground(forDelete: phoneIsLTR),
      secondaryBackground: CardBackground(forDelete: !phoneIsLTR),
      confirmDismiss: (direction) async {
        if (direction != DismissDirection.endToStart && direction != DismissDirection.startToEnd) {
          //dismiss
          return false;
        }
        bool swipeFromRightToLeft = false;

        if ((direction == DismissDirection.endToStart && phoneIsLTR) ||
            (direction == DismissDirection.startToEnd && !phoneIsLTR)) {
          swipeFromRightToLeft = true;
        }
        if (swipeFromRightToLeft) {
          openUpdateDeviceDialoge(context, cubit);
          //update function no need to remove from the list
          return false;
        }
        //if deleteing done remove it
        return await cubit.deleteDevice(device);
      },
      child: DeviceCardBody(device: device),
    );
  }

  void openUpdateDeviceDialoge(BuildContext context, MainCubit cubit) async {
    final res = await showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return AddDeviceDialoge(
          oldDevice: device,
        );
      },
    );
    if (res is DeviceEntity) {
      cubit.updateDevice(res);
    }
  }
}

class CardBackground extends StatelessWidget {
  const CardBackground({super.key, required this.forDelete});
  final bool forDelete;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: forDelete ? Colors.redAccent : Colors.orange,
      alignment: forDelete ? Alignment.centerLeft : Alignment.centerRight,
      padding: forDelete ? const EdgeInsets.only(left: 25) : const EdgeInsets.only(right: 25),
      child: Icon(
        forDelete ? Icons.delete : Icons.edit,
        color: Colors.white,
      ),
    );
  }
}
