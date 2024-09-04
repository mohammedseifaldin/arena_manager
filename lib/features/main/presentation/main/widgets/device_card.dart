import 'package:arena_manager/core/app_localization/app_localization.dart';
import 'package:arena_manager/core/app_styles/app_colors.dart';
import 'package:arena_manager/core/enums.dart';
import 'package:arena_manager/core/utilities/navigators.dart';
import 'package:arena_manager/features/main/domain/entites/reservation_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entites/device_entity.dart';
import '../controller/main_cubit.dart';
import 'add_reservation_dialoge.dart';
import 'device_card_dismissible.dart';

// ignore: must_be_immutable
class DeviceCard extends StatelessWidget {
  final DeviceEntity device;

  DeviceCard({
    required this.device,
    super.key,
  });
  DateTime? reservationStartTime;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MainCubit>();
    return BlocListener<MainCubit, MainState>(
      listener: (context, state) {
        if (state is GettingReservation) {
          if (state.deviceId != device.id) {
            //not for this device
            return;
          }
          if (state.processState == ProcessState.processing) {
            return;
          }

          if (state.processState == ProcessState.failed) {
            showMessage(state.result, Colors.redAccent);
            return;
          }
          if (state.reservation != null) {
            reservationStartTime = state.reservation!.startTime;
            openReservationDetailDialoge(context, state.reservation!);
            return;
          }
          createNewReservation(context);
        }
        if (state is DeleteingReservation) {
          if (state.processState == ProcessState.failed) {
            showMessage(state.result, Colors.redAccent);
          }
          if (state.processState == ProcessState.done) {
            if (reservationStartTime == null) return;
            showPaymentDialoge(context, startTime: reservationStartTime!, device: device);
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

  showPaymentDialoge(BuildContext context,
      {required DateTime startTime, required DeviceEntity device}) {
    int price = calcNumber(startTime, device);
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "sessionHasClosed".translate(),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ), // Title of the dialog
            content: Row(
              children: [
                Text("clientPayment".translate()),
                Text(
                  "$price ${"price".translate()}",
                  style: const TextStyle(color: AppColors.kPrimaryColor),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('close'.translate()),
              ),
            ],
          );
        });
  }

  int calcNumber(DateTime startTime, DeviceEntity device) {
    double minutePrice = device.hourPrice / 60;
    Duration playedTime = DateTime.now().difference(startTime);
    return (playedTime.inMinutes * minutePrice).toInt();
  }
}
