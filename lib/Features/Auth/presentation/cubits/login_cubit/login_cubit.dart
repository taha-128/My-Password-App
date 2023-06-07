// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_password/Core/utils/app_router.dart';

import '../../../../../Core/utils/functions.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  rebuildScreen() {
    emit(LoginLoading());
  }

  bool isVerified = FirebaseAuth.instance.currentUser?.emailVerified ?? false;

  Future<void> userLogin(
      {required BuildContext context,
      required FirebaseAuth auth,
      required GlobalKey<FormState> formKey,
      required TextEditingController emailController,
      required TextEditingController passwordController}) async {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      try {
        await auth.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        GoRouter.of(context).pushReplacementNamed(
          FirebaseAuth.instance.currentUser!.emailVerified
              ? AppRouter.kHomeView
              : AppRouter.kVerificationView,
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'invaild-email') {
          Functions.errorToast(context, 'Your email is invaild',
              'please check your email and try again');
        } else if (e.code == 'wrong-password') {
          Functions.errorToast(context, 'Wrong password',
              'please check your password and try again');
        } else {
          Functions.errorToast(context, 'User Not Found',
              'this user not found please try again');
        }
      }
    } else {
      Functions.errorToast(context, 'No internet connection',
          'please check your internet connectio and try again');
    }
  }

  Future<void> checkVerfication() async {
    FirebaseAuth.instance.currentUser?.reload();

    isVerified = FirebaseAuth.instance.currentUser!.emailVerified;
  }
}
