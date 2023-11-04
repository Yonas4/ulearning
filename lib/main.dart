import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/Pages/Setting/SettingsPage.dart';
import 'package:ulearning/Pages/Welcome/bloc/welcome_bloc.dart';
import 'package:ulearning/Pages/Welcome/bloc/welcome_view.dart';
import 'package:ulearning/Pages/sing_in/sing_in_view.dart';

import 'localization/app_localizations.dart';
import 'localization/cubit/locale_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          create: (context) => LocaleCubit()..getSavedLanguage(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return BlocBuilder<LocaleCubit, ChangeLocaleState>(
            builder: (context, state) {
              return MaterialApp(
                locale: state.locale,
                supportedLocales: const [Locale('en'), Locale('ar')],
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate
                ],
                localeResolutionCallback: (deviceLocale, supportedLocales) {
                  for (var locale in supportedLocales) {
                    if (deviceLocale != null &&
                        deviceLocale.languageCode == locale.languageCode) {
                      return deviceLocale;
                    }
                  }

                  return supportedLocales.first;
                },
                debugShowCheckedModeBanner: false,
                title: 'title',
                theme: ThemeData(
                    appBarTheme: const AppBarTheme(
                        elevation: 0, backgroundColor: Colors.white)),
                home: WelcomePage(),
                routes: {
                  // 'homePage':const HomePageView(),
                  'singIn': (context) => const SingInPage(),
                  'settingPage': (context) => const SettingsPage(),
                },
              );
            },
          );
        },
      ),
    );
  }
}
