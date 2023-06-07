import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        fontFamily: 'Inter',
        color: Colors.white,
      ),
      //
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Color(0xFFFFFFFF),
        fontFamily: 'Inter',
      ),
      //
      titleSmall: TextStyle(
        fontWeight: FontWeight.w700,
        fontFamily: 'Nunito',
        color: Colors.white,
      ),
    ),
    //
    cardColor: const Color(0xFF454642),
    //
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: Colors.white,
      onSecondary: const Color(0xFF333333),
    ),
    //
    shadowColor: const Color.fromARGB(40, 255, 255, 255),
  );

  static ThemeData lightTheme = ThemeData.light().copyWith(
    textTheme: const TextTheme(
      //
      titleLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        fontFamily: 'Inter',
        color: Color(0xFF011444),
      ),
      //
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Color(0xFFAFB3BD),
        fontFamily: 'Inter',
      ),
      //
      titleSmall: TextStyle(
        fontWeight: FontWeight.w700,
        fontFamily: 'Nunito',
        color: Colors.black,
      ),
    ),
    //
    cardColor: const Color(0xFFFFEBDC),
    //
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: Colors.black,
      onSecondary: const Color.fromARGB(255, 228, 231, 235),
    ),
    //
    shadowColor: const Color.fromARGB(121, 43, 43, 43),
  );
}
