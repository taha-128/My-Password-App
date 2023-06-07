import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inner_shadow_widget/inner_shadow_widget.dart';

import '../../../../../constants.dart';

class InitUserImageWidget extends StatelessWidget {
  const InitUserImageWidget({super.key, required this.fontSize});
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return InnerShadow(
      blur: 10,
      color: const Color(0xFF000000).withOpacity(0.28),
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * .43,
        height: MediaQuery.of(context).size.width * .43,
        decoration: BoxDecoration(
          color: MyColors.kPurple,
          shape: BoxShape.circle,
        ),
        child: Text(
          FirebaseAuth.instance.currentUser!.displayName![0].toUpperCase(),
          style: TextStyle(fontSize: fontSize),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
