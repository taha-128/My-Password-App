import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_password/Core/utils/app_themes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wave_transition/wave_transition.dart';

import '../../../../Core/utils/app_router.dart';
import '../views/profile_view.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ThemeChanged());

  SharedPreferences? prefs;

  bool? isDark;

  ThemeData? themeData;

  Future<void> initializePreferences() async {
    prefs = await SharedPreferences.getInstance();
    isDark = prefs?.getBool('isDark') ?? false;
    await getThemeData(); // Call getThemeData() here
    debugPrint('$isDark');
  }

  Future<void> getThemeData() async {
    if (isDark ?? false) {
      themeData = AppThemes.darkTheme;
    } else {
      themeData = AppThemes.lightTheme;
    }
  }

  void changeTheme(BuildContext c) async {
    prefs = await SharedPreferences.getInstance();
    //Changing Animation
    if (c.mounted) {
      Navigator.push(
        c,
        WaveTransition(
          child: const ProfileView(),
          center: const FractionalOffset(0.90, 0.90),
          duration: const Duration(milliseconds: 1000),
        ),
      );
    }
    //Change ThemeData
    if (themeData != null) {
      if (themeData == AppThemes.lightTheme) {
        themeData = AppThemes.darkTheme;
      } else {
        themeData = AppThemes.lightTheme;
      }
    } else {
      themeData = AppThemes.darkTheme;
    }
    isDark = themeData == AppThemes.darkTheme;
    await prefs?.setBool('isDark', isDark!);
    //Emit State
    emit(ThemeChanged());
  }

  void deleteUserAccount(BuildContext context) async {
    while (true) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .delete()
          .whenComplete(
            () => FirebaseAuth.instance.currentUser!.delete()
              ..whenComplete(
                () => FirebaseAuth.instance.signOut()
                  ..whenComplete(
                    () => GoRouter.of(context).pushReplacementNamed(
                      AppRouter.kRegisterView,
                    ),
                  ),
              ),
          );
    }
  }
}
