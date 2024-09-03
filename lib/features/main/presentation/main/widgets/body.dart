import 'package:arena_manager/features/main/presentation/main/controller/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entites/device_entity.dart';
import 'device_card.dart';

class Body extends StatelessWidget {
  const Body({super.key, required this.children});
  final List<DeviceEntity> children;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await context.read<MainCubit>().getData();
      },
      child: ListView(
        children: children.map((item) => DeviceCard(device: item)).toList(),
      ),
    );
  }
}
