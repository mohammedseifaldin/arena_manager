import 'package:arena_manager/core/app_localization/app_localization.dart';
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
    return await box.add(data);
  }

  static remove({dynamic data, required String boxName}) async {
    final box = await _getBox(boxName);
    final index = await _getKey(box: box, data: data);
    await box.delete(index);
  }

  static update({dynamic data, required String boxName}) async {
    final box = await _getBox(boxName);
    final key = await _getKey(box: box, data: data);
    if (key == null) {
      throw "itemNotFound".translate();
    }
    // await box.delete(key);
    await box.put(key, data);
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

  static Future _getKey({dynamic data, required Box box}) async {
    for (var key in box.keys) {
      if (box.get(key) == null) {
        continue;
      }
      if (box.get(key).id == data.id) {
        return key;
      }
    }
    return null;
  }
}
