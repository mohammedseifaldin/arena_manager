import 'package:arena_manager/core/enums.dart';
import 'package:arena_manager/core/utilities/navigators.dart';
import 'package:arena_manager/features/main/domain/entites/reservation_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entites/device_entity.dart';
import '../controller/main_cubit.dart';
import 'add_reservation_dialoge.dart';
import 'device_card_dismissible.dart';

class DeviceCard extends StatelessWidget {
  final DeviceEntity device;

  const DeviceCard({
    required this.device,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MainCubit>();
    return BlocListener<MainCubit, MainState>(
      listener: (context, state) {
        if (state is GettingReservation) {
          if (state.processState == ProcessState.failed) {
            showMessage(state.result, Colors.redAccent);
          }
          if (state.processState == ProcessState.done) {
            if (state.reservation != null) {
              openReservationDetailDialoge(context, state.reservation!);
            } else {
              createNewReservation(context);
            }
          }
        }
      },
      child: GestureDetector(
        onTap: () {
          cubit.getReservation(deviceId: device.id);
        },
        child: DeviceCardDismissible(device: device),
      ),
    );
  }

  openReservationDetailDialoge(BuildContext context, ReservationEntity reservation) async {
    final res = await showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return AddReservationDialoge(
          deviceId: device.id,
          oldReservation: reservation,
        );
      },
    );
    if (context.mounted && res == "Close it") {
      context.read<MainCubit>().deleteReservation(reservation);
    }
  }

  createNewReservation(BuildContext context) async {
    final res = await showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return AddReservationDialoge(
          deviceId: device.id,
        );
      },
    );
    if (context.mounted && res is ReservationEntity) {
      context.read<MainCubit>().addReservation(res);
    }
  }
}
