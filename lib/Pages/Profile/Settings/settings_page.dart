import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/Pages/Profile/Settings/bloc/settings_bloc.dart';
import 'package:ulearning/Pages/Profile/Settings/localization/app_localizations.dart';
import 'package:ulearning/Pages/applicition/bloc/application_bloc.dart';
import 'package:ulearning/Pages/applicition/bloc/application_event.dart';
import 'package:ulearning/common/Value/constant.dart';

import '../../../common/Routes/names.dart';
import '../../../global/global.dart';
import 'Widgets/setting_widget.dart';
import 'bloc/settings_state.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  removeUserData() {
    context.read<ApplicationBloc>().add(const TriggerAppEvent(0));
    Global.storageService.remove(AppConstant.STORAGE_USER_TOKEN_KEY);
    Navigator.pushNamedAndRemoveUntil(
        context, AppRoutes.SING_IN, (rout) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  logOutButton(context, removeUserData),
                  state is ChangeLocaleSettingState
                      ? DropdownButton<String>(
                          value: state.locale.languageCode,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: ['ar', 'en'].map((String items) {
                            return DropdownMenuItem<String>(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              context
                                  .read<SettingsBloc>()
                                  .changeLanguage(newValue);
                            }
                          },
                        )
                      : SizedBox()

                  // buildBlocConsumer()
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
