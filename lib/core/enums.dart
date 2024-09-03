import 'package:arena_manager/core/strings/app_assets.dart';

enum ProcessState { idle, processing, failed, done }

enum PlayingDevices {
  xbox(icon: AppAssets.xbox, name: "XBOX"),
  pc(icon: AppAssets.pc, name: "PC"),
  playstation(icon: AppAssets.playStation, name: "Playstation");

  final String name, icon;

  const PlayingDevices({required this.icon, required this.name});
  static PlayingDevices getDeviceFromName(String name) {
    return PlayingDevices.values.firstWhere((e) => e.name == name);
  }
}
