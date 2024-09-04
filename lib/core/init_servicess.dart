import 'package:arena_manager/router/notification.dart';
import 'package:timezone/data/latest_all.dart' as tz;

import '../features/main/data/hive_helper.dart';
import '../features/main/data/shared_preferences.dart';
import 'utilities/service_locator.dart';

Future<void> initServicess() async {
  await AppSp.init();
  await HiveHelper.init();
  ServicesLocator().init();
  tz.initializeTimeZones();
  NotificationManager.initDetail();
  await NotificationManager.initPlugin();
}
