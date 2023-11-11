import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/Pages/Register/register_bloc.dart';
import 'package:ulearning/Pages/Register/register_controller.dart';
import 'package:ulearning/Pages/Register/register_event.dart';
import 'package:ulearning/Pages/Register/register_state.dart';
import 'package:ulearning/localization/app_localizations.dart';

import '../common_widgets.dart';

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
          appBar: buildAppBar(context,'Sing Up'),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h,),
                Center(child: reusableText('Enter your details below and free sing up')),
                Container(
                  margin: EdgeInsets.only(top: 36.h),
                  padding: EdgeInsets.only(left: 25.w, right: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText('User Name'),
                      buildTextField('Enter your name', 'email', 'user',
                          (value) {
                          context.read<RegisterBloc>().add(UserNameEvent(value));
                      }),
                      reusableText('email'.tr(context)),
                      buildTextField('Enter your Email', 'email', 'user',
                              (value) {
                              context.read<RegisterBloc>().add(EmailEvent(value));
                          }),
                      reusableText('password'.tr(context)),
                      buildTextField('Enter password', 'password', 'lock',
                          (value) {
                         context.read<RegisterBloc>().add(PasswordEvent(value));
                      }),

                      reusableText('Re-enter password'),
                      buildTextField('Re-enter password password', 'password', 'lock',
                          (value) {
                         context.read<RegisterBloc>().add(ConfirmPasswordEvent(value));
                      }),
                      reusableText('Enter your details below and free sing up'),
                      buildLoginRegButton('Sing Up', 'login', () {
                        RegisterController(context: context).handelEmailRegister();
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
