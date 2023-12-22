import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/Pages/Profile/Settings/localization/app_localizations.dart';
import 'package:ulearning/Pages/common_widgets.dart';
import 'package:ulearning/Pages/sing_in/sing_in_controller.dart';
import 'package:ulearning/Pages/sing_in/bloc/sing_in_state.dart';
import 'package:ulearning/common/Routes/names.dart';

import 'bloc/sing_in_bloc.dart';
import 'bloc/sing_in_event.dart';

class SingInPage extends StatelessWidget {
  const SingInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SingInBloc, SingInState>(
      builder: (context, state) {
        return _buildPage(context, state);
      },
    );
  }

  Widget _buildPage(BuildContext context, SingInState state) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(context, 'log_in'.tr(context)),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildThirdPartyLogin(context),
                Center(child: reusableText('login_msg'.tr(context))),
                Container(
                  margin: EdgeInsets.only(top: 36.h),
                  padding: EdgeInsets.only(left: 25.w, right: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText('email'.tr(context)),
                      SizedBox(height: 5.h),
                      buildTextField('email_hint'.tr(context), 'email', 'user',
                          (value) {
                        context.read<SingInBloc>().add(EmailEvent(value));
                      }),
                      reusableText('password'.tr(context)),
                      buildTextField(
                          'pass_hint'.tr(context), 'password', 'lock', (value) {
                        context.read<SingInBloc>().add(PasswordEvent(value));
                      }),
                      forgotPassword('forgot_pas'.tr(context)),
                      SizedBox(
                        height: 70.h,
                      ),
                      buildLoginRegButton('log_in'.tr(context), 'login', () {
                        SingInController(context: context)
                            .handelSingIn('email');
                      }),
                      buildLoginRegButton('sing_up'.tr(context), 'register',
                          () {
                        Navigator.pushNamed (
                          context,
                          AppRoutes.REGISTER,
                        );
                      }),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
