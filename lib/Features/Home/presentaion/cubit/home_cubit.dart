import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:my_password/Core/utils/functions.dart';
import 'package:my_password/Core/utils/styles.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeCubitInitial());

  DocumentReference<Map<String, dynamic>> userDoc = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser?.uid);

  List<dynamic>? accounts;

  List<dynamic>? emails, passwords, icons;

  int? userSpace;

  add({required String array, required String value}) => userDoc.update(
        ({
          array: FieldValue.arrayUnion([value])
        }),
      );

  delete({required String array, required String value}) => userDoc.update(
        ({
          array: FieldValue.arrayRemove([value])
        }),
      );

  void addUserSpace(BuildContext context) {
    String text =
        'Sorry it is not allow for you, if you need more contact the app creator';
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        content: Text(
          text,
          textAlign: TextAlign.center,
          style: Styles.textStyle18.copyWith(color: Colors.red),
        ),
      ),
    );
    //! int oldUserSpace = userSpace! + 3;
    //! userDoc.update({'user_space': '$oldUserSpace'});
  }

  Future<void> addAcc({
    required String email,
    required String password,
    required String icon,
    required BuildContext c,
  }) async {
    bool result = await InternetConnectionCheckerPlus().hasConnection;

    final key = encrypt.Key.fromLength(32);
    final iv = encrypt.IV.fromLength(16);
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final encrypted = encrypter.encrypt(password, iv: iv);

    if (result == true) {
      if (accounts!.length != userSpace!) {
        accounts?.add(
          {
            'email': email,
            'password': encrypted.base64,
            'icon': icon,
          },
        );
        FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser?.uid)
            .update(
          {'accounts': accounts},
        );

        if (c.mounted) {
          GoRouter.of(c).pop();
          Functions.successToast(
            c,
            'Successed',
            'Account adding successfuly',
          );
        }
      } else {
        if (c.mounted) {
          GoRouter.of(c).pop();
          Functions.errorToast(
            c,
            'Check your space',
            'You can\'t add any accounts left',
          );
        }
      }
    } else {
      if (c.mounted) {
        GoRouter.of(c).pop();
        Functions.errorToast(
          c,
          'You can\'t add new account',
          'Please check your internet connection',
        );
      }
    }

    emit(state);
  }

  Future<void> delAcc({required int i, required BuildContext c}) async {
    bool result = await InternetConnectionCheckerPlus().hasConnection;
    if (result == true) {
      accounts?.removeAt(i);
      FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .update(
        {'accounts': accounts},
      );
    } else {
      if (c.mounted) {
        Functions.errorToast(c, 'You can\'t delete the account',
            'Please check your internet connection');
      }
    }
    emit(state);
  }
}
