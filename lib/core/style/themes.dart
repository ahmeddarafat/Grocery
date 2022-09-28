import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:uccd_flutter/core/style/colors.dart';

class Apptheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: const ColorScheme.light(
      primary: AppColors.orange,
      secondary: AppColors.brawn
    ),
    textTheme: TextTheme(
      /// the headline text
      headline1: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.brawn,
      ),

      /// the subtitle text
      subtitle1: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.brawn,
      ),

      /// the hint subtitle
      subtitle2: TextStyle(
        fontSize: 11.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.lightBrawn,
      ),
    ),
  );
}
