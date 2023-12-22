import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/Pages/Profile/Settings/localization/app_localizations.dart';
import 'package:ulearning/Pages/Register/bloc/register_bloc.dart';
import 'package:ulearning/Pages/Register/register_controller.dart';
import 'package:ulearning/Pages/Register/bloc/register_state.dart';


import '../common_widgets.dart';
import 'bloc/register_event.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return _buildPage(context, state);
      },
    );
  }

  Widget _buildPage(BuildContext context, RegisterState state) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(context, 'sing_up'.tr(context)),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Center(child: reusableText('sing_up_msg'.tr(context))),
                Container(
                  margin: EdgeInsets.only(top: 36.h),
                  padding: EdgeInsets.only(left: 25.w, right: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText('user_name'.tr(context)),
                      buildTextField('name_hint'.tr(context), 'email', 'user',
                          (value) {
                        context.read<RegisterBloc>().add(UserNameEvent(value));
                      }),
                      reusableText('email'.tr(context)),
                      buildTextField('email_hint'.tr(context), 'email', 'user',
                          (value) {
                        context.read<RegisterBloc>().add(EmailEvent(value));
                      }),
                      reusableText('password'.tr(context)),
                      buildTextField(
                          'pass_hint'.tr(context), 'password', 'lock', (value) {
                        context.read<RegisterBloc>().add(PasswordEvent(value));
                      }),
                      reusableText('conf_pass'.tr(context)),
                      buildTextField(
                          'conf_hint'.tr(context), 'password', 'lock',
                          (value) {
                        context
                            .read<RegisterBloc>()
                            .add(ConfirmPasswordEvent(value));
                      }),
                      reusableText('sing_up_msg2'.tr(context)),
                      buildLoginRegButton('sing_up'.tr(context), 'login', () {
                        RegisterController(context: context)
                            .handelEmailRegister();
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
