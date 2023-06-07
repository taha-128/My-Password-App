import 'package:flutter/material.dart';
import 'package:my_password/Core/utils/styles.dart';

class PasswordDifficultyWidget extends StatelessWidget {
  const PasswordDifficultyWidget({
    super.key,
    required this.passwordDifficultyProportion,
    required this.text,
    required this.color,
  });
  final double passwordDifficultyProportion;
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedContainer(
            width: MediaQuery.of(context).size.width *
                1 /
                passwordDifficultyProportion,
            height: MediaQuery.of(context).size.height * 0.017,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(15),
            ),
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 10),
            child: Text(
              text,
              style: Styles.passwordTextStyle.copyWith(
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
