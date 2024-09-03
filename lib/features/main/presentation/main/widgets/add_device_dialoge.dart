import 'package:arena_manager/core/app_localization/app_localization.dart';
import 'package:arena_manager/core/enums.dart';
import 'package:arena_manager/core/utilities/navigators.dart';
import 'package:arena_manager/core/utilities/validators.dart';
import 'package:arena_manager/features/main/domain/entites/device_entity.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:flutter/material.dart';

import '../../../../../core/app_styles/app_styles.dart';

class AddDeviceDialoge extends StatefulWidget {
  const AddDeviceDialoge({super.key, required this.id});
  final int id;

  @override
  State<AddDeviceDialoge> createState() => _AddDeviceDialogeState();
}

class _AddDeviceDialogeState extends State<AddDeviceDialoge> {
  final _formKey = GlobalKey<FormState>();
  final nameCtrl = TextEditingController();
  final priceCtrl = TextEditingController();
  final typeCtrl = DropdownController();
  PlayingDevices? playingDevice;
  @override
  void dispose() {
    nameCtrl.dispose();
    priceCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: nameCtrl,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: 'deviceName'.translate(),
                  border: AppStyles.buildOutlineInputBorder(),
                ),
                validator: defaultValidator,
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                width: double.infinity,
                child: CoolDropdown(
                  controller: typeCtrl,
                  defaultItem: CoolDropdownItem(label: "choseType".translate(), value: null),
                  dropdownOptions: DropdownOptions(
                    borderRadius: BorderRadius.circular(15),
                    gap: const DropdownGap.only(betweenItems: 2),
                  ),
                  isMarquee: true,
                  resultOptions: ResultOptions(
                    errorBoxDecoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.redAccent,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    boxDecoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  dropdownList: PlayingDevices.values.map((e) {
                    return CoolDropdownItem(label: e.name, value: e);
                  }).toList(),
                  onChange: (selectedItem) {
                    if (selectedItem != null) {
                      playingDevice = selectedItem;
                    }
                    typeCtrl.close();
                  },
                ),
              ),
              const SizedBox(height: 24.0),
              TextFormField(
                controller: priceCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'hourPrice'.translate(),
                  border: AppStyles.buildOutlineInputBorder(),
                ),
                validator: priceValidator,
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 42, 134, 45),
                  ),
                  onPressed: () {
                    if (playingDevice == null) {
                      typeCtrl.error();
                    }
                    if (_formKey.currentState!.validate()) {
                      pagePop(DeviceEntity(
                        id: widget.id,
                        name: nameCtrl.text,
                        typeName: playingDevice!.name,
                        avaliable: true,
                        hourPrice: int.parse(priceCtrl.text),
                      ));
                    }
                  },
                  child: Text(
                    'save'.translate(),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
