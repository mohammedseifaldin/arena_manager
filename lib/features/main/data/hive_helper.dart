import 'package:arena_manager/core/strings/hive_boxes.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../domain/entites/device_entity.dart';

class HiveHelper {
  static Future init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(DeviceEntityAdapter());
    await Hive.openBox(HiveBoxes.deviceBox);
  }

  static Future add({dynamic data, required String boxName}) async {
    final box = await _getBox(boxName);
    if (data.runtimeType == List) {
      return await box.addAll(data);
    }
    return await box.add(data);
  }

  static remove({dynamic data, required String boxName}) async {
    final box = await _getBox(boxName);
    if (data.runtimeType == List) {
      if (data[0].runtimeType == box.runtimeType) {
        return await box.deleteAll(data.keys);
      }
    }
    if (data.runtimeType == box.runtimeType) {
      return await box.delete(data);
    }
  }

  static update({dynamic data, required String boxName}) async {
    print(data);
    // final box = await getBox(boxName);
    // if (data.runtimeType == box.runtimeType) {
    //     if(box.containsKey (data)){
    //       box.delete(data);
    //       box.delete(data);
    //     }

    // }
  }

  static Future get({dynamic data, required String boxName}) async {
    final box = await _getBox(boxName);
    return box.values.toList();
  }

  static Future<void> clear() async {
    await Hive.deleteFromDisk();
  }

  static Future<Box> _getBox(String boxName) async {
    return Hive.box(boxName);
  }
}
