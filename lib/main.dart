// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:uccd_flutter/core/style/themes.dart';
import 'package:uccd_flutter/ui/get_started_page.dart';
import 'package:uccd_flutter/ui/login_page.dart';

void main() {
  /// to make splash screen static to test it
    // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder:
        (BuildContext context, Orientation orientation, DeviceType deviceType) {
      return MaterialApp(
        title: 'Flutter Demo',
        themeMode: ThemeMode.light,
        theme: Apptheme.lightTheme,
        home: GetStartedPage(),
      );
    });
  }
}


