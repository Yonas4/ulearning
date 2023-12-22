import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ulearning/Pages/Profile/Settings/localization/app_localizations.dart';
import 'package:ulearning/Pages/sing_in/bloc/sing_in_bloc.dart';
import 'package:ulearning/common/APIs/user_api.dart';
import 'package:ulearning/common/Routes/names.dart';
import 'package:ulearning/common/Value/constant.dart';
import 'package:ulearning/common/entities/entities.dart';
import 'package:ulearning/global/global.dart';

import '../../common/Widgets/flutter_toast.dart';

class SingInController {
  final BuildContext context;

  const SingInController({required this.context});

  Future<void> handelSingIn(String type) async {
    try {
      if (type == 'email') {
        final state = context.read<SingInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          toastInfo(message: 'fill_email_error_msg'.tr(context));
          return;
        }
        if (password.isEmpty) {
          toastInfo(message: 'fill_pass_error_msg'.tr(context));
          return;
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (credential.user == null) {
            toastInfo(message: 'sign_failed'.tr(context));
            return;
          }
          if (!credential.user!.emailVerified) {
            toastInfo(message: 'email_verified'.tr(context));
            return;
          }

          var user = credential.user;

          if (user != null) {
            String? name = user.displayName;
            String? email = user.email;
            String? id = user.uid;
            String? photoUrl = user.photoURL;

            LoginRequestEntity loginRequestEntity = LoginRequestEntity(
                email: email,
                name: name,
                avatar: photoUrl,
                open_id: id,
                // 1   means email login
                type: 1);

            asyncPostUserData(loginRequestEntity);

            toastInfo(message: "login_successfully".tr(context));

            return;
          } else {
            toastInfo(message: 'not_login'.tr(context));
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'network-request-failed') {
            toastInfo(message: 'no_internet'.tr(context));
            //devtools.log('No Internet Connection');
          } else if (e.code == "wrong-password") {
            return toastInfo(message: 'wrong_password'.tr(context));
            //devtools.log('Please Enter correct password');
            //print('Please Enter correct password');
          } else if (e.code == 'user-not-found') {
            toastInfo(message: 'user_not_found'.tr(context));
            // print('Email not found');
          } else if (e.code == 'too-many-requests') {
            return toastInfo(message: 'too_many_requests'.tr(context));
            //print('Too many attempts please try later');
          } else if (e.code == 'invalid-email') {
            toastInfo(message: 'invalid_email'.tr(context));
            //print('Email and password field are required');
          } else if (e.code == 'unknown') {
            toastInfo(message: 'unknown_error'.tr(context));
            //print(e.code);
          } else {
            print(e.code);
          }
        }
      }
    } catch (_) {}
  }

  void asyncPostUserData(LoginRequestEntity loginRequestEntity) async {
    EasyLoading.show(
        dismissOnTap: true,
        indicator: const CircularProgressIndicator(),
        maskType: EasyLoadingMaskType.clear);

    var result = await UserApi.login(param: loginRequestEntity);

    if (result.code == 200) {
      try {
        Global.storageService.setString(
            AppConstant.STORAGE_USER_PROFILE_KEY, jsonEncode(result.data!));
        Global.storageService.setString(
            AppConstant.STORAGE_USER_TOKEN_KEY, result.data!.access_token!);
        EasyLoading.dismiss();
        Navigator.of(context)
            .pushNamedAndRemoveUntil(AppRoutes.APPLICATION, (rout) => false);
      } catch (e) {
        print('saving user local storage error ${e.toString()}');
      }
    } else {
      EasyLoading.dismiss();
      toastInfo(message: 'Unknown error ');
    }
  }
}
