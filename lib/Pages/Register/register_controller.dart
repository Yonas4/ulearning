import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/Pages/Register/register_bloc.dart';
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
      toastInfo(message: 'User Name can not be empty');
      return;
    }
    if (email.isEmpty) {
      toastInfo(message: 'Email can not be empty');
      return;
    }
    if (password.isEmpty) {
      toastInfo(message: 'Password can not be empty');
      return;
    }
    if (rePassword.isEmpty) {
      toastInfo(message: 'Re-Password can not be empty');
      return;
    }
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);

        toastInfo(
            message:
                'an email has been sent to your registered email. to activate it please check your email box and click on link');
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(message: 'the password provided is too weak');
        return;
      } else if (e.code == 'email-already-in-use') {
        toastInfo(message: 'the email already in use');
        return;
      } else if (e.code == 'invalid-email') {
        toastInfo(message: 'the email is invalid');
        return;
      }
    }
  }
}
