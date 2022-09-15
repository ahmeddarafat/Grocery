// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:uccd_flutter/core/resources/navigators.dart';
import 'package:uccd_flutter/core/style/colors.dart';
import 'package:uccd_flutter/core/widgets/default_eleveted_button.dart';
import 'package:uccd_flutter/core/widgets/default_outline_button.dart';
import 'package:uccd_flutter/ui/login_page.dart';
import 'package:uccd_flutter/ui/sign_up_page.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset('assets/images/get_started.svg'),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  "Relax & Shop",
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "Shop online and get grocories delivered from stores to your home in as fast as 1 hour .",
                  style: Theme.of(context).textTheme.subtitle1,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 2.h,
                ),
                DefaultElevetedButton(title: 'Sign Up',
                onPressed:() =>  Navigators.naviagteTo(context, SignUpPage())
                ),
                SizedBox(
                  height: 1.h,
                ),
                DefaultOutlineButton(
                  title: 'Sign In',
                  onPressed: ()=>Navigators.naviagteTo(context, LoginPage()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


