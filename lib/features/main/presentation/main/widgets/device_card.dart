import 'package:flutter/material.dart';

import '../../../domain/entites/device_entity.dart';

class DeviceCard extends StatelessWidget {
  const DeviceCard({super.key, required this.device});
  final DeviceEntity device;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(device.name),
            ],
          ),
        ],
      ),
    );
  }
}
