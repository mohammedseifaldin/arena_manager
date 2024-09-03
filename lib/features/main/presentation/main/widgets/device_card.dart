import 'package:arena_manager/features/main/presentation/main/widgets/device_card_dismissible.dart';
import 'package:flutter/material.dart';

import '../../../domain/entites/device_entity.dart';

class DeviceCard extends StatelessWidget {
  final DeviceEntity device;

  const DeviceCard({
    required this.device,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: DeviceCardDismissible(device: device),
    );
  }
}
