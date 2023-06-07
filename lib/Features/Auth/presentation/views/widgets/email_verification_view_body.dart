import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_password/Core/utils/app_router.dart';
import 'package:my_password/Core/utils/styles.dart';
import 'package:my_password/constants.dart';

class EmailVerificationViewBody extends StatefulWidget {
  const EmailVerificationViewBody({Key? key}) : super(key: key);

  @override
  State<EmailVerificationViewBody> createState() =>
      _EmailVerificationViewBodyState();
}

class _EmailVerificationViewBodyState extends State<EmailVerificationViewBody> {
  bool isEmailVerified = false;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.currentUser?.sendEmailVerification();
    timer =
        Timer.periodic(const Duration(seconds: 3), (_) => checkEmailVerified());
  }

  checkEmailVerified() async {
    User? user = FirebaseAuth.instance.currentUser;
    await user?.reload();

    setState(() {
      isEmailVerified = user!.emailVerified;
    });

    if (isEmailVerified) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        'accounts': [],
        'email': user!.email,
        'display_name': user.displayName,
        'isActivated': true,
        'user_space': '10',
      });
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text("Email Successfully Verified"),
          ),
        );
      }

      timer?.cancel();
      Future.delayed(
        const Duration(seconds: 2),
        () => GoRouter.of(context).pushReplacementNamed(AppRouter.kHomeView),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Center(
                child: Text(
                  'We have sent you a Email on  ${FirebaseAuth.instance.currentUser?.email}',
                  textAlign: TextAlign.center,
                  style: Styles.textStyle30.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: LoadingAnimationWidget.flickr(
                size: 80,
                leftDotColor: MyColors.kCyan,
                rightDotColor: Theme.of(context).colorScheme.secondary,
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Center(
                child: Text(
                  'Verifying email....',
                  textAlign: TextAlign.center,
                  style: Styles.textStyle15.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 58),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: ElevatedButton(
                child: const Text('Resend'),
                onPressed: () {
                  try {
                    FirebaseAuth.instance.currentUser?.sendEmailVerification();
                  } catch (e) {
                    debugPrint('$e');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
