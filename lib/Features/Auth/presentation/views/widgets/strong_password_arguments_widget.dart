import 'package:flutter/material.dart';
import 'package:my_password/Core/utils/styles.dart';

class StrongPasswordArgumnetsWidget extends StatelessWidget {
  const StrongPasswordArgumnetsWidget({
    super.key,
    required this.lenghtArg,
    required this.lowAndUppCaseArg,
    required this.numArg,
    required this.specialMarkArg,
  });

  final Color lenghtArg, lowAndUppCaseArg, numArg, specialMarkArg;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Password lenght must be 8 or higer',
            textAlign: TextAlign.left,
            style: Styles.argumentsTextStyle.copyWith(
              color: lenghtArg,
            ),
          ),
          Text(
            'Password must contain lower and upper case',
            style: Styles.argumentsTextStyle.copyWith(
              color: lowAndUppCaseArg,
            ),
          ),
          Text(
            'Password must contain numbers',
            style: Styles.argumentsTextStyle.copyWith(
              color: numArg,
            ),
          ),
          Text(
            'Password must contain special mark',
            style: Styles.argumentsTextStyle.copyWith(
              color: specialMarkArg,
            ),
          ),
        ],
      ),
    );
  }
}
