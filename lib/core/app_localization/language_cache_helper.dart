import 'dart:ui';

import '../../features/main/data/shared_preferences.dart';

class LanguageCacheHelper {
  LanguageCacheHelper._();
  static Future<void> set({required String languageCode}) async {
    AppSp.setString(key: SPVars.locale, value: languageCode);
  }

  static Future<void> useSystemLang() async {
    AppSp.removeKey(SPVars.locale);
  }

  static Locale get() {
    final cachedLanguageCode = AppSp.getString(SPVars.locale);
    if (cachedLanguageCode != null) {
      return Locale(cachedLanguageCode);
    }
    return _getSystemLang();
  }

  static Locale _getSystemLang() {
    final lang = PlatformDispatcher.instance.locale;
    if (lang.languageCode.toLowerCase() == 'ar') {
      return const Locale('ar');
    }
    return const Locale('en');
  }
}
