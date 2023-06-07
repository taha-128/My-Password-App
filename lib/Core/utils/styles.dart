import 'package:flutter/material.dart';

import 'package:my_password/constants.dart';

class Styles {
  static const textStyle30 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    fontFamily: 'Inter',
  );
  static const textStyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontFamily: 'Inter',
  );
  static const textStyle15 = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontFamily: 'Inter',
  );

  static const textStyle18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Color(0xFFAFB3BD),
    fontFamily: 'Inter',
  );

  static const textStyle13 = TextStyle(
    fontSize: 13,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
  );
  static final argumentsTextStyle = TextStyle(
    fontSize: 11,
    fontFamily: 'Inter',
    color: MyColors.kRed,
    fontWeight: FontWeight.bold,
  );

  static final textStyle10r = TextStyle(
    fontSize: 10,
    color: MyColors.kRed,
    fontWeight: FontWeight.w400,
    fontFamily: 'Inter',
  );
  static final passwordTextStyle = TextStyle(
    fontSize: 10,
    color: MyColors.kGreen,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
  );
}
