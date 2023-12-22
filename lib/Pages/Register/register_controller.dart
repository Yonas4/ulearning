import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/Pages/Profile/Settings/localization/app_localizations.dart';
import 'package:ulearning/Pages/Register/bloc/register_bloc.dart';
import 'package:ulearning/common/Value/constant.dart';
import 'package:ulearning/common/Widgets/flutter_toast.dart';

class RegisterController {
  final BuildContext context;

  const RegisterController({required this.context});

  Future<void> handelEmailRegister() async {
    final state = context.read<RegisterBloc>().state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.confirmPassword;

    if (userName.isEmpty) {
      toastInfo(message: 'name_empty'.tr(context));
      return;
    }
    if (email.isEmpty) {
      toastInfo(message: 'email_empty'.tr(context));
      return;
    }
    if (password.isEmpty) {
      toastInfo(message: 'pass_empty'.tr(context));
      return;
    }
    if (rePassword.isEmpty) {
      toastInfo(message: 'conf_pass_empty'.tr(context));
      return;
    }
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);

        String photoUrl = '${AppConstant.SERVER_API_URL}uploads/default.png';
        credential.user?.updatePhotoURL(photoUrl);
        toastInfo(message: 'register_success'.tr(context));
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(message: 'weak_password'.tr(context));
        return;
      } else if (e.code == 'email-already-in-use') {
        toastInfo(message: 'email_already_in_use'.tr(context));
        return;
      } else if (e.code == 'invalid-email') {
        toastInfo(message: 'invalid_email_register'.tr(context));
        return;
      }
    }
  }
}
