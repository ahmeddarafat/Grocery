// ignore_for_file: prefer_const_constructors

import 'package:device_preview/device_preview.dart' as preview;
import 'package:flutter/material.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:uccd_flutter/core/style/themes.dart';
import 'package:uccd_flutter/data/providers/local/cache_helper.dart';
import 'package:uccd_flutter/data/providers/remote/dio_helper.dart';
import 'package:uccd_flutter/ui/auth/sign_up_page.dart';
import 'package:uccd_flutter/ui/auth/get_started_page.dart';
import 'package:uccd_flutter/ui/main_pages/cart_page.dart';
import 'package:uccd_flutter/ui/main_pages/layouts.dart';
import 'package:uccd_flutter/ui/subpages/categories/product_details.dart';
// import 'package:uccd_flutter/ui/auth/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  final String? token = CacheHelper.getString(key: 'token');
  DioHelper.init();
  runApp(preview.DevicePreview(
    builder: (BuildContext context) => MyApp(
      token: token,
    ),
  ));
}

class MyApp extends StatelessWidget {
  final String? token;
  const MyApp({super.key, this.token});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder:
        (BuildContext context, Orientation orientation, DeviceType deviceType) {
      return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: Apptheme.lightTheme,
        home: token == null ? GetStartedPage() : Layouts(),
        // home: CartPage(),
      );
    });
  }
}


/// draft 

  // to make splash screen static to test it
  // var widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);