import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_password/Core/utils/app_router.dart';
import 'package:my_password/Core/utils/svgs.dart';
import 'package:my_password/Features/Profile/presentation/cubit/profile_cubit.dart';
import 'package:my_password/Features/Profile/presentation/views/widgets/account_details.dart';

import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../../../Core/utils/styles.dart';
import '../../../../../constants.dart';
import 'app_creator.dart';
import 'button_widget.dart';

class ButtonsColumn extends StatelessWidget {
  const ButtonsColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ButtonWidget(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return const AccountDetails();
              },
            );
          },
          assetName: Svgs.user,
          text: 'Account details',
          textColor: ProfileViewColors.kOrange,
        ),
        ButtonWidget(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return const AppCreator();
              },
            );
          },
          text: 'App Creator',
          assetName: Svgs.appCreator,
          textColor: ProfileViewColors.kPurple,
        ),
        ButtonWidget(
          onTap: () {
            FirebaseAuth.instance.signOut().then(
                  (value) => GoRouter.of(context).pushReplacementNamed(
                    AppRouter.kLoginView,
                  ),
                );
          },
          text: 'Logout',
          assetName: Svgs.logout,
          textColor: ProfileViewColors.kLime,
        ),
        ZoomTapAnimation(
          onTap: () {
            ProfileCubit cubit = BlocProvider.of<ProfileCubit>(context);
            cubit.deleteUserAccount(context);
          },
          begin: 1,
          end: .9,
          beginDuration: const Duration(milliseconds: 200),
          endDuration: const Duration(milliseconds: 300),
          child: Container(
            width: MediaQuery.of(context).size.width * .7,
            height: MediaQuery.of(context).size.height * .06,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: ProfileViewColors.kRed,
            ),
            child: Text(
              'Delete Account',
              style: Styles.textStyle20.copyWith(
                fontFamily: 'Nunito',
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  
}
