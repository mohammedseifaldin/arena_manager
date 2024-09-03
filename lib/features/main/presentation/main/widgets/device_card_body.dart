import 'package:arena_manager/core/app_localization/app_localization.dart';
import 'package:arena_manager/core/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../domain/entites/device_entity.dart';

class DeviceCardBody extends StatelessWidget {
  const DeviceCardBody({super.key, required this.device});
  final DeviceEntity device;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: IntrinsicHeight(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                PlayingDevices.getDeviceFromName(device.typeName).icon,
                width: 40,
                height: 40,
                theme: const SvgTheme(currentColor: Colors.grey),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    device.name,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _formatText(device.hourPrice),
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                color: device.avaliable ? Colors.green : Colors.red,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 30),
          ],
        ),
      ),
    );
  }

  String _formatText(int price) {
    return _formatInteger(price.toString()) + "price/hour".translate();
  }

  String _formatInteger(String price) {
    if (price.length <= 3) {
      return price;
    }
    String returnString = price.substring(price.length - 3); //the last 3 digits
    returnString = ',$returnString'; //add comma
    returnString =
        _formatInteger(price.substring(0, price.length - 3)) + returnString; //recursive call
    return returnString;
  }
}
