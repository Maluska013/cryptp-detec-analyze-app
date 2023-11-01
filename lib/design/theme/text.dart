import 'package:flutter/material.dart';

class AppTextTheme {
  AppTextTheme();

  static TextStyle get title => const TextStyle(
        fontSize: 20,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        height: 24 / 20,
      );

  static TextStyle get subtitle => const TextStyle(
        fontSize: 14,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        height: 24 / 14,
      );

  static TextStyle get bodyText1 => const TextStyle(
        fontSize: 14,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        height: 24 / 14,
      );

  static TextStyle get bodyText2 => const TextStyle(
        fontSize: 16,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        height: 24 / 16,
      );

  TextStyle get button => const TextStyle(
        fontSize: 16,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        height: 24 / 16,
      );
}
