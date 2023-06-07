import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_password/Core/utils/functions.dart';
import 'package:my_password/Features/Home/presentaion/cubit/home_cubit.dart';
import '../../../../../constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dialog_button.dart';
import 'my_text_widget.dart';

class AccountDetialsDialog extends StatelessWidget {
  const AccountDetialsDialog(
      {super.key,
      required this.email,
      required this.password,
      required this.i,
      required this.icon});
  final String email, password, icon;
  final int i;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height * .42,
        decoration: myDecoration(
          colors: [
            MyColors.kYellow,
            const Color(0xFF958290),
            MyColors.kBlue,
          ],
          borderRadius: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SvgPicture.asset(
                  'assets/svgs/$icon.svg',
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
            const SizedBox(height: 30),
            MyTextWidget(
              title: 'Email: ',
              description: email,
            ),
            const SizedBox(height: 20),
            MyTextWidget(
              title: 'Password: ',
              description: password,
            ),
            const Spacer(),
            DialogButton(
              onPressed: () {
                BlocProvider.of<HomeCubit>(context).delAcc(i: i, c: context);
                GoRouter.of(context).pop();
                Functions.deleteToast(
                  context: context,
                  title: 'Deleted',
                  description: 'Account deleting successfuly',
                );
              },
              text: 'Delete',
              splashColor: const Color.fromARGB(255, 255, 17, 0),
              begin: const Color(0xFFD837AE),
              end: MyColors.kRed,
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
