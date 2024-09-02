import 'package:arena_manager/core/app_localization/cubit/locale_cubit.dart';
import 'package:arena_manager/core/app_styles/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/init_servicess.dart';
import 'features/main/presentation/main/pages/main_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServicess();
  runApp(const MyApp());
}

final navKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocaleCubit()..getSavedLanguage(),
        ),
      ],
      child: BlocBuilder<LocaleCubit, ChangeLocaleState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Play Zone',
            debugShowCheckedModeBanner: false,
            navigatorKey: navKey,
            locale: state.locale,
            supportedLocales: LocaleCubit.supportedLocales,
            localizationsDelegates: LocaleCubit.localizationsDelegates,
            localeResolutionCallback: (_, __) => state.locale,
            theme: AppTheme.getTheme(),
            home: const MainScreen(),
          );
        },
      ),
    );
  }
}
