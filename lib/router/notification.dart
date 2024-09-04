import 'package:arena_manager/core/app_localization/app_localization.dart';
import 'package:arena_manager/core/strings/shared_preferences_vars.dart';
import 'package:arena_manager/features/main/data/shared_preferences.dart';
import 'package:arena_manager/features/main/domain/entites/reservation_entity.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationManager {
  NotificationManager._();
  static late final FlutterLocalNotificationsPlugin notificationsPlugin;
  static late final NotificationDetails _platformChannelSpecifics;

  static void showImediatly() async {
    await notificationsPlugin.show(_getId(), 'Scheduled Notification',
        'This is the notification body', _platformChannelSpecifics);
  }

  static void scheduleNotification(ReservationEntity reservation) {
    notificationsPlugin.zonedSchedule(
      _getId(),
      'sessionOver'.translate(),
      "${reservation.clientName} ${'clientSessionOver'.translate()}",
      _getTime(reservation.endTime),
      _platformChannelSpecifics,
      androidScheduleMode: AndroidScheduleMode.alarmClock,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.wallClockTime,
    );
  }

  static int _getId() {
    int notifyId = AppSp.getInt(SPVars.notifyId) ?? 1;
    notifyId++;
    AppSp.setInt(key: SPVars.notifyId, value: notifyId);
    return notifyId;
  }

  static tz.TZDateTime _getTime(DateTime time) {
    time = time.toUtc();
    tz.TZDateTime scheduledDate = tz.TZDateTime(
        tz.local, time.year, time.month, time.day, time.hour, time.minute, time.second);
    return scheduledDate;
  }

  static void initDetail() {
    const AndroidNotificationDetails androidSpecifics = AndroidNotificationDetails(
      '1',
      'Session over',
      channelDescription: 'to tell the manager that the client session has over',
      importance: Importance.max,
      icon: "@mipmap/ic_launcher",
      priority: Priority.max,
      showWhen: false,
      autoCancel: true,
    );

    _platformChannelSpecifics = const NotificationDetails(
      android: androidSpecifics,
    );
  }

  static Future initPlugin() async {
    notificationsPlugin = FlutterLocalNotificationsPlugin();
    const initAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    const settings = InitializationSettings(android: initAndroid);

    final granted = await notificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.areNotificationsEnabled();

    if (granted == false) {
      notificationsPlugin
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
          ?.requestNotificationsPermission();
    }
    await notificationsPlugin.initialize(settings);
  }
}
