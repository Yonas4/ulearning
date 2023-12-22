import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/Pages/HomePage/bloc/home_page_bloc.dart';
import 'package:ulearning/Pages/HomePage/home_page.dart';
import 'package:ulearning/Pages/Profile/Settings/bloc/settings_bloc.dart';
import 'package:ulearning/Pages/Register/bloc/register_bloc.dart';
import 'package:ulearning/Pages/Register/register_page.dart';
import 'package:ulearning/Pages/Welcome/bloc/welcome_bloc.dart';
import 'package:ulearning/Pages/Welcome/welcome_page.dart';
import 'package:ulearning/Pages/applicition/application_page.dart';
import 'package:ulearning/Pages/applicition/bloc/application_bloc.dart';
import 'package:ulearning/Pages/sing_in/bloc/sing_in_bloc.dart';
import 'package:ulearning/Pages/sing_in/sing_in_page.dart';
import 'package:ulearning/common/Routes/names.dart';
import 'package:ulearning/global/global.dart';

import '../../Pages/Profile/Settings/settings_page.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
          routes: AppRoutes.INITIAL,
          pages: WelcomePage(),
          bloc: BlocProvider(create: (_) => WelcomeBloc())),
      PageEntity(
          routes: AppRoutes.SING_IN,
          pages: const SingInPage(),
          bloc: BlocProvider(create: (_) => SingInBloc())),
      PageEntity(
          routes: AppRoutes.REGISTER,
          pages: const Register(),
          bloc: BlocProvider(create: (_) => RegisterBloc())),
      PageEntity(
        routes: AppRoutes.SETTING,
        pages: const SettingPage(),
        // bloc: BlocProvider(create: (_) => SettingsBloc()),
        bloc: BlocProvider(create: (_) => SettingsBloc()..getSavedLanguage()),
      ),
      PageEntity(
          routes: AppRoutes.APPLICATION,
          pages: const ApplicationPage(),
          bloc: BlocProvider(create: (_) => ApplicationBloc())),
      PageEntity(
          routes: AppRoutes.HOME_PAGE,
          pages: const HomePage(),
          bloc: BlocProvider(create: (_) => HomePageBloc())),
      //todo setting page in video
      // PageEntity(
      //     routes: AppRoutes.SETTING_PAGE,
      //     pages: const SettingsPage(),
      //     bloc: BlocProvider(create: (_) => SettingsBloc())),
    ];
  }

  //return the all blocProviders
  static List<dynamic> allBlocProvider(BuildContext context) {
    List<dynamic> blocProvider = [];
    for (var bloc in routes()) {
      blocProvider.add(bloc.bloc);
      // blocProvider.add(bloc.cubit);
    }

    return blocProvider;
  }

  //a model that covers entire screen as we click on Navigator object
  static MaterialPageRoute generateRoutSetting(RouteSettings settings) {
    if (settings.name != null) {
      //check for route name macheng when Navigator gets triggered .
      var result = routes().where((element) => element.routes == settings.name);
      if (result.isNotEmpty) {
        print('valid name${settings.name}');

        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();

        if (result.first.routes == AppRoutes.INITIAL && deviceFirstOpen) {
          bool isLoggedIn = Global.storageService.getIsLoggedIn();
          if (isLoggedIn) {
            return MaterialPageRoute(
                builder: (_) => const ApplicationPage(), settings: settings);
          }
          return MaterialPageRoute(
              builder: (_) => const SingInPage(), settings: settings);
        }

        return MaterialPageRoute(
            builder: (_) => result.first.pages, settings: settings);
      }
    }
    print('invalid name${settings.name}');

    //error page
    return MaterialPageRoute(
        builder: (_) => const SingInPage(), settings: settings);
  }
}

class PageEntity {
  String routes;
  Widget pages;
  dynamic bloc;

  // dynamic cubit;

  PageEntity({
    required this.routes,
    required this.pages,
    this.bloc,
  });
}
