import 'package:arena_manager/core/app_localization/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../language_cache_helper.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<ChangeLocaleState> {
  static const supportedLocales = [Locale('ar'), Locale('en')];
  static const localizationsDelegates = [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate
  ];

  LocaleCubit() : super(ChangeLocaleState(locale: Locale(LanguageCacheHelper.get().toString())));

  void getSavedLanguage() {
    print(1);
    final Locale cachedLocale = LanguageCacheHelper.get();
    emit(ChangeLocaleState(locale: cachedLocale));
  }

  Future<void> changeLanguage(String languageCode) async {
    await LanguageCacheHelper.set(languageCode: languageCode);
    emit(ChangeLocaleState(locale: Locale(languageCode)));
  }
}
