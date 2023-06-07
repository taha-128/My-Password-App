import 'package:flutter/material.dart';
import 'package:my_password/Core/utils/styles.dart';
import 'package:my_password/constants.dart';
import 'remainig_user_accounts_circle_widget.dart';

class RemainingUserAccountsWidget extends StatelessWidget {
  const RemainingUserAccountsWidget({
    super.key,
    required this.usageSpace,
    required this.userSpace,
    required this.dataLoaded,
  });
  final int usageSpace;
  final int userSpace;
  final bool dataLoaded;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(11),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.17,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          colors: [
            MyColors.kDarkBlue,
            MyColors.kPurple,
            MyColors.kOrange,
          ],
          end: Alignment.centerLeft,
          begin: Alignment.centerRight,
        ),
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                usageSpace == 0
                    ? 'Try adding new account'
                    : 'You added $usageSpace accounts',
                style: Styles.textStyle20,
              ),
              Text(
                userSpace / usageSpace == 1
                    ? 'Now you haven’t accounts left'
                    : 'You can add ${userSpace - usageSpace} accounts more',
                style: Styles.textStyle15.copyWith(
                  color: const Color(0xFFFFEBDC),
                ),
              ),
            ],
          ),
          const Spacer(),
          RemainingUserAccountsCircleWidget(
            usageSpace: usageSpace,
            userSpace: userSpace,
          ),
        ],
      ),
    );
  }
}
