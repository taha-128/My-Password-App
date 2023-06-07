// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_password/Core/utils/app_router.dart';
import 'package:my_password/Core/utils/functions.dart';
import 'package:my_password/Features/Auth/presentation/views/widgets/register_form_widget.dart';
import 'package:my_password/constants.dart';

import '../../../data/users_collection.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  TextEditingController controller = RegisterFormWidget.password;

  Color passwordDifficultyColor = Colors.white;

  Color lowAndUppCaseArg = MyColors.kRed;

  Color specialMarkArg = MyColors.kRed;

  Color lenghtArg = MyColors.kRed;

  Color numArg = MyColors.kRed;

  double passwordDifficultyProportion = 1;

  String passwordDifficultyText = 'strong';

  bool passIsStrong = false;

  Future<void> userRegister({
    required String displayName,
    required String password,
    required String email,
    required GlobalKey<FormState> formKey,
    required BuildContext context,
    required FirebaseAuth auth,
  }) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        if (formKey.currentState!.validate() &&
            BlocProvider.of<RegisterCubit>(context).passIsStrong == true) {
          try {
            UserCredential userCredential =
                await auth.createUserWithEmailAndPassword(
              email: email,
              password: password,
            );
            await userCredential.user!.updateDisplayName(displayName);

            await addUser(
              displayName: displayName,
              email: email,
              docId: userCredential.user!.uid,
              isActive: false,
            );
            
            GoRouter.of(context)
                .pushReplacementNamed(AppRouter.kVerificationView);
          } catch (signUpError) {
            final emailUsed = await auth.fetchSignInMethodsForEmail(email);
            if (emailUsed.isNotEmpty) {
              
              Functions.errorToast(context, 'Email already in use',
                  'this email already in use you can login or use another email');
            } else {
              Functions.errorToast(
                context,
                'There was an error',
                '$signUpError',
              );
            }
          }
        }
      }
    } catch (e) {
      if (e.toString() ==
          '[firebase_auth/invalid-email] The email address is badly formatted.') {
        Functions.errorToast(
            context, 'Incorrect email', 'Please write a correct email address');
      } else {
        Functions.errorToast(
            context, 'There was an error', 'sorry but there was an error');
      }
    }
  }

  void passwordOnChanged(
      {required BuildContext context, required GlobalKey<FormState> formKey}) {
    int lenght = controller.text.length;
    emit(
      RegisterInitial(),
    );
    argumentsCheck();
    if (lenght == 0) {
      init();
      passIsStrong == false;
    } else if (weakPasswordRequriements(lenght)) {
      weak();
      passIsStrong = false;
    } else if (controller.text == '123456' || controller.text == '1234567') {
      weak();
      passIsStrong = false;
    } else if (mediumPasswordRequriements(lenght)) {
      medium();
      passIsStrong = false;
    } else if (strongPasswordRequriements(lenght)) {
      strong();
      passIsStrong = true;
    }
  }

  void argumentsCheck() {
    if (controller.text.length >= 7) {
      lenghtArg = MyColors.kGreen;
    } else {
      lenghtArg = MyColors.kRed;
    }
    if (controller.text.contains(RegExp("(?=.*[0-9])"))) {
      numArg = MyColors.kGreen;
    } else {
      numArg = MyColors.kRed;
    }
    if (controller.text.contains(RegExp("(?=.*[A-Z])(?=.*[a-z])"))) {
      lowAndUppCaseArg = MyColors.kGreen;
    } else {
      lowAndUppCaseArg = MyColors.kRed;
    }
    if (controller.text.contains(RegExp("(?=.*[~!?@#\$%^&*_-])"))) {
      specialMarkArg = MyColors.kGreen;
    } else {
      specialMarkArg = MyColors.kRed;
    }
  }

  void init() {
    passwordDifficultyProportion = 100;
    passwordDifficultyColor = Colors.transparent;
    numArg = Colors.transparent;
    lowAndUppCaseArg = Colors.transparent;
    specialMarkArg = Colors.transparent;
    lenghtArg = Colors.transparent;
  }

  void weak() {
    passwordDifficultyProportion = 4;
    passwordDifficultyColor = MyColors.kRed;
    passwordDifficultyText = 'weak';
  }

  void medium() {
    passwordDifficultyProportion = 2;
    passwordDifficultyColor = MyColors.kYellow;
    passwordDifficultyText = 'medium';
  }

  void strong() {
    passwordDifficultyProportion = 1;
    passwordDifficultyColor = MyColors.kGreen;
    passwordDifficultyText = 'strong';
  }

  bool weakPasswordRequriements(int lenght) => lenght <= 5;

  bool mediumPasswordRequriements(int lenght) {
    return lenght >= 6 &&
        (argumentsOr(MyColors.kGreen)) &&
        (argumentsOr(MyColors.kRed));
  }

  bool strongPasswordRequriements(int lenght) {
    return lenght >= 7 && arugemntsAnd(MyColors.kGreen);
  }

  bool arugemntsAnd(Color color) {
    return numArg == color &&
        lowAndUppCaseArg == color &&
        specialMarkArg == color &&
        lenghtArg == color;
  }

  bool argumentsOr(Color color) {
    return numArg == color ||
        lowAndUppCaseArg == color ||
        specialMarkArg == color ||
        lenghtArg == color;
  }
}
