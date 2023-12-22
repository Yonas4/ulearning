import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/Pages/Profile/Settings/bloc/settings_bloc.dart';
import 'package:ulearning/Pages/Profile/Settings/bloc/settings_state.dart';
import 'package:ulearning/common/Value/colors.dart';

import 'Pages/Profile/Settings/localization/app_localizations.dart';
import 'common/Routes/routes.dart';
import 'global/global.dart';

void main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProvider(context)],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (_, child) {
          return BlocBuilder<SettingsBloc, SettingsState>(
            builder: (context, state) {
              if (state is ChangeLocaleSettingState) {
                return MaterialApp(
                  builder: EasyLoading.init(),
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
                  title: 'Ulearning',
                  theme: ThemeData(
                      useMaterial3: true,
                      appBarTheme: const AppBarTheme(
                          iconTheme:
                              IconThemeData(color: AppColors.primaryText),
                          elevation: 0,
                          backgroundColor: Colors.white)),
                  onGenerateRoute: AppPages.generateRoutSetting,
                );
              }
              return const SizedBox();
            },
          );
        },
      ),
    );
  }
}
