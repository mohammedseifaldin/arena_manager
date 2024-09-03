import 'package:flutter/material.dart';

import '../../../domain/entites/device_entity.dart';
import 'device_card_body.dart';

class Body extends StatelessWidget {
  const Body({super.key, required this.children});
  final List<DeviceEntity> children;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: children.map((item) => DeviceCardBody(device: item)).toList(),
    );
  }
}
