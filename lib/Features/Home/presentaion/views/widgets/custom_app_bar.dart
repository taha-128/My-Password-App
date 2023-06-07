import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_password/Core/utils/app_router.dart';
import 'package:my_password/Core/utils/styles.dart';
import 'package:my_password/Features/Home/presentaion/cubit/home_cubit.dart';
import 'package:my_password/constants.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../../Profile/presentation/views/widgets/init_user_image_widget.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double imageSize = width * 0.12;
    String userDisplayName = FirebaseAuth.instance.currentUser!.displayName!;
    return Row(
      children: [
        ZoomTapAnimation(
          begin: 1,
          end: 1.2,
          beginDuration: const Duration(milliseconds: 200),
          endDuration: const Duration(milliseconds: 300),
          onTap: () {
            GoRouter.of(context).pushNamed(AppRouter.kProfileView);
          },
          child: Container(
            width: imageSize,
            height: imageSize,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            ),
            child: const InitUserImageWidget(fontSize: 40),
          ),
        ),
        const SizedBox(width: 3),
        SizedBox(
          width: width * .3,
          child: Text(
            '  Hello \n @$userDisplayName',
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        const Spacer(),
        Container(
          alignment: Alignment.center,
          width: width * .35,
          height: height * .053,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11),
            gradient: LinearGradient(
              colors: [
                MyColors.kCyan,
                MyColors.kPurple,
                MyColors.kGreen,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: MaterialButton(
            splashColor: MyColors.kDarkBlue,
            minWidth: width * .35,
            height: height * .053,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(11),
            ),
            onPressed: () {
              BlocProvider.of<HomeCubit>(context).addUserSpace(context);
            },
            child: Text(
              'Get 3 Accounts',
              style: Styles.textStyle13.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
