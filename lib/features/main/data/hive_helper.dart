import 'package:hive_flutter/hive_flutter.dart';

// const kCourseBox = "course box";

class HiveHelper {
  static Future init() async {
    await Hive.initFlutter();
    // Hive.registerAdapter(CourseEntityAdapter());
    // await Hive.openBox(kTeacherBox);
  }

  static Future saveBooksData(dynamic data, String boxName) async {
    await Hive.openBox<dynamic>(boxName).then((box) => box.addAll(data));
  }

  static removeBookData(dynamic data, String boxName) async {
    await Hive.openBox(boxName).then((box) => box.delete(data));
  }

  static Future<void> clear() async {
    await Hive.deleteFromDisk();
  }
}
