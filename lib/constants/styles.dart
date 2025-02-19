import 'package:flutter/material.dart';
import 'package:meet_your_doctor/constants/dimensions.dart';

const rubikRegular = TextStyle(
  fontFamily: 'Rubik',
  fontSize: Dimensions.fontSizeDefault,
  fontWeight: FontWeight.w400,
);

const rubikMedium = TextStyle(
  fontFamily: 'Rubik',
  fontSize: Dimensions.fontSizeDefault,
  fontWeight: FontWeight.w500,
);

const rubikBold = TextStyle(
  fontFamily: 'Rubik',
  fontSize: Dimensions.fontSizeDefault,
  fontWeight: FontWeight.w700,
);

class MyColors {
  static int header01 = 0xff151a56;
  static int primary = 0xff575de3;
  static int purple01 = 0xff918fa5;
  static int purple02 = 0xff6b6e97;
  static int yellow01 = 0xffeaa63b;
  static int yellow02 = 0xfff29b2b;
  static int bg = 0xfff5f3fe;
  static int bg01 = 0xff6f75e1;
  static int bg02 = 0xffc3c5f8;
  static int bg03 = 0xffe8eafe;
  static int text01 = 0xffbec2fc;
  static int grey01 = 0xffe9ebf0;
  static int grey02 = 0xff9796af;
}

TextStyle kTitleStyle = TextStyle(
  color: Color(MyColors.header01),
  fontWeight: FontWeight.bold,
);

TextStyle kFilterStyle = TextStyle(
  color: Color(MyColors.bg02),
  fontWeight: FontWeight.w500,
);
