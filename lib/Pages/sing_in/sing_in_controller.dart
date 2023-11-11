import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/Pages/sing_in/sing_in_bloc.dart';

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
          toastInfo(message: 'You need to fill email address');
          return;
        }
        if (password.isEmpty) {
          toastInfo(message: 'You need to fill password');
          return;
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (credential.user == null) {
            toastInfo(message: "You don't exist");
            return;
          }
          if (!credential.user!.emailVerified) {
            toastInfo(message: 'You need to  verified your email');
            return;
          }

          var user = credential.user;

          if (user != null) {
            toastInfo(message: 'login successfully');
            return;
          } else {
            toastInfo(message: 'Currently you are not a user of the app');
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'network-request-failed') {
            toastInfo(message: 'No Internet Connection');
            //devtools.log('No Internet Connection');
          } else if (e.code == "wrong-password") {
            return toastInfo(message: 'Please Enter correct password');
            //devtools.log('Please Enter correct password');
            //print('Please Enter correct password');
          } else if (e.code == 'user-not-found') {
            toastInfo(message: 'Email not found');
            // print('Email not found');
          } else if (e.code == 'too-many-requests') {
            return toastInfo(message: 'Too many attempts please try later');
            //print('Too many attempts please try later');
          } else if (e.code == 'invalid-email') {
            toastInfo(message: 'Email and email field are required');
            //print('Email and password field are required');
          } else if (e.code == 'unknown') {
            toastInfo(message: 'Email and Password Fields are required');
            //print(e.code);
          } else {
            print(e.code);
          }
        }
      }
    } catch (_) {}
  }
}
