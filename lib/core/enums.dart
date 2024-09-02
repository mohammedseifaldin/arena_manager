import 'package:arena_manager/core/app_assets.dart';

enum PlayingDevices {
  xbox(icon: AppAssets.xbox, name: "XBOX"),
  pc(icon: AppAssets.pc, name: "PC"),
  playstation(icon: AppAssets.playStation, name: "Playstation");

  final String name, icon;

  const PlayingDevices({required this.icon, required this.name});
}
