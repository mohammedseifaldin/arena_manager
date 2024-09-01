import '../features/main/data/hive_helper.dart';
import '../features/main/data/shared_preferences.dart';
import 'utilities/service_locator.dart';

Future<void> initServicess() async {
  await AppSp.init();
  await HiveHelper.init();
  ServicesLocator().init();
}
