// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:uccd_flutter/core/resources/assets_path.dart';
import 'package:uccd_flutter/core/resources/navigators.dart';
import 'package:uccd_flutter/core/style/colors.dart';
import 'package:uccd_flutter/core/widgets/default_eleveted_button.dart';
import 'package:uccd_flutter/core/widgets/default_text_form_field.dart';
import 'package:uccd_flutter/ui/sign_up_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: signInAppBar(context),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                      child: SvgPicture.asset(AppAssets.login, height: 28.h)),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    'Enter your Email and password',
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        ?.copyWith(fontSize: 16.sp),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    "To continue ...",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  DefaultTextFormField(
                    hint: 'email',
                    textEditingController: emailController,
                    validator: (value) {
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  DefaultTextFormField(
                    hint: 'Password',
                    textEditingController: passwordController,
                    validator: (value) {
                      return null;
                    },
                    showSuffixIcon: true,
                    isPassword: true,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                        onPressed: () {},
                        child: const Text("Forget Password?")),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  DefaultElevetedButton(
                    title: "Sign In",
                    onPressed: () {},
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account ?"),
                      TextButton(
                        onPressed: () {
                          Navigators.naviagteReplacementTo(
                              context, SignUpPage());
                        },
                        child: Text('Sign Up'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }

  /// Method helpers

    AppBar signInAppBar(BuildContext context) {
      return AppBar(
        title: Text('Sign In',
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColors.orange, fontSize: 16.sp)),
        centerTitle: true,
        backgroundColor: AppColors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: AppColors.orange,
          onPressed: () => Navigator.pop(context),
        ),
      );
    }
}
