import 'package:arena_manager/core/app_localization/app_localization.dart';
import 'package:arena_manager/core/enums.dart';
import 'package:arena_manager/core/utilities/navigators.dart';
import 'package:arena_manager/core/utilities/validators.dart';
import 'package:arena_manager/features/main/domain/entites/reservation_entity.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:flutter/material.dart';

import '../../../../../core/app_styles/app_styles.dart';
import '../../../../../core/utilities/formatters.dart';

class AddReservationDialoge extends StatefulWidget {
  const AddReservationDialoge({
    super.key,
    required this.deviceId,
    this.oldReservation,
  });
  final int deviceId;
  final ReservationEntity? oldReservation;

  @override
  State<AddReservationDialoge> createState() => _AddReservationDialogeState();
}

class _AddReservationDialogeState extends State<AddReservationDialoge> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController nameCtrl;
  late final TextEditingController timeCtrl;
  late final bool oldReservation;
  DateTime? endTime;
  PlayingDevices? playingDevice;
  @override
  void initState() {
    oldReservation = widget.oldReservation != null;
    nameCtrl = TextEditingController(text: widget.oldReservation?.clientName);
    timeCtrl = TextEditingController(text: durationToString(widget.oldReservation));
    super.initState();
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    timeCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom, left: 32, right: 32, top: 16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: nameCtrl,
              keyboardType: TextInputType.name,
              enabled: !oldReservation,
              decoration: InputDecoration(
                labelText: 'clientName'.translate(),
                border: AppStyles.buildOutlineInputBorder(),
              ),
              validator: defaultValidator,
            ),
            const SizedBox(height: 12.0),
            InkWell(
              onTap: () async {
                final pickedTime = await pickTime(context);
                if (pickedTime == null) {
                  return;
                }
                endTime = timeToDate(pickedTime);
                timeCtrl.text = formDuration(endTime: endTime!);
              },
              child: TextFormField(
                controller: timeCtrl,
                keyboardType: TextInputType.none,
                enabled: false,
                decoration: InputDecoration(
                  labelText: oldReservation ? 'timeRemaining'.translate() : 'time'.translate(),
                  border: AppStyles.buildOutlineInputBorder(),
                ),
                validator: (_) {
                  if (endTime == null && !oldReservation) {
                    return "pleaseFillThis".translate();
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 42, 134, 45),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (widget.oldReservation == null) {
                      //this id is temporarly
                      pagePop(ReservationEntity(
                        id: -1,
                        deviceId: widget.deviceId,
                        clientName: nameCtrl.text,
                        startTime: DateTime.now(),
                        endTime: endTime!,
                      ));
                    } else {
                      pagePop("Close it");
                    }
                  }
                },
                child: Text(
                  oldReservation ? 'closeSession'.translate() : 'saveSession'.translate(),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  CoolDropdownItem defaultItem() {
    if (widget.oldReservation == null) {
      //newDevice
      return CoolDropdownItem(label: "choseType".translate(), value: null);
    } else {
      return CoolDropdownItem(label: playingDevice!.name, value: playingDevice);
    }
  }

  String? durationToString(ReservationEntity? reservation) {
    if (reservation != null) {
      return formDuration(startTime: reservation.startTime, endTime: reservation.endTime);
    }
    return null;
  }

  Future<TimeOfDay?> pickTime(BuildContext context) async {
    return await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(), // Default to current time
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );
  }

  DateTime timeToDate(TimeOfDay time) {
    DateTime dateNow = DateTime.now();
    if (time.hour < DateTime.now().hour) {
      //reservation ends tomorow
      dateNow = dateNow.add(const Duration(days: 1));
    }
    return dateNow.copyWith(hour: time.hour, minute: time.minute);
  }
}
