import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/Pages/sing_in/widgets/sing_in_widget.dart';
import 'package:ulearning/localization/app_localizations.dart';

import 'sing_in_bloc.dart';
import 'sing_in_event.dart';

class SingInPage extends StatelessWidget {
  const SingInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SingInBloc()..add(InitEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<SingInBloc>(context);

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(context),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildThirdPartyLogin(context),
                Center(child: reusableText('loginMsg1'.tr(context))),
                Container(
                  margin: EdgeInsets.only(top: 36.h),
                  padding: EdgeInsets.only(left: 25.w,right: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText('email'.tr(context)),
                      SizedBox(height:5.h),
                      buildTextField('Enter your Email', 'email','user'),
                      reusableText('password'.tr(context)),
                      buildTextField('Email', 'password','user'),
                      forgotPassword('Forgot Password ?'),
                      buildLoginRegButton('Log In','login'),
                      buildLoginRegButton('LogIn','register'),
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
