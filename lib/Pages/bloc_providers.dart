import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/Pages/Register/register_bloc.dart';
import 'package:ulearning/Pages/sing_in/sing_in_bloc.dart';

import '../localization/cubit/locale_cubit.dart';
import 'Welcome/bloc/welcome_bloc.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(lazy: false, create: (context) => WelcomeBloc()),
        BlocProvider(
            lazy: false,
            create: (context) => LocaleCubit()..getSavedLanguage()),
        BlocProvider(create: (context) => SingInBloc()),
        BlocProvider(create: (context) => RegisterBloc()),
      ];
}
