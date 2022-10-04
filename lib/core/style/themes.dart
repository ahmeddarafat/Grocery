import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:uccd_flutter/core/style/colors.dart';

class Apptheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.orange,
          // statusBarIconBrightness: Brightness.light,
        )),
    colorScheme: const ColorScheme.light(
        primary: AppColors.orange, secondary: AppColors.brawn),
    textTheme: TextTheme(
      /// the headline text
      headline1: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.brawn,
      ),

      /// the subtitle text
      subtitle1: TextStyle(
        fontSize: 11.sp,
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

class AppStyle {
  static TextStyle headline1Brawn = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.brawn,
  );
  static TextStyle headline1Orange = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.orange,
  );
  static TextStyle subtitle1 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.brawn,
  );
  static TextStyle subtitle2 = TextStyle(
    fontSize: 11.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.lightBrawn,
  );
  static TextStyle orangeText = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.orange,
  );
  static TextStyle brawnText = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.brawn,
  );

}
