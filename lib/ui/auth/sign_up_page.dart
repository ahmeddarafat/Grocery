// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:uccd_flutter/core/resources/assets_path.dart';
import 'package:uccd_flutter/core/resources/navigators.dart';
import 'package:uccd_flutter/core/style/colors.dart';
import 'package:uccd_flutter/core/widgets/default_eleveted_button.dart';
import 'package:uccd_flutter/core/widgets/default_text_form_field.dart';
import 'package:uccd_flutter/ui/auth/login_page.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final passwordController = TextEditingController();

  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: signUpAppBar(context),
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
                      child: SvgPicture.asset(AppAssets.signUP, height: 22.h)),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    'Hello !',
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        ?.copyWith(fontSize: 20.sp,letterSpacing: 3),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    "For the security & safety please choose a password",
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  DefaultTextFormField(
                     hint: "User name",
                    textEditingController: nameController,
                      validator: (value){
                        return null;
                      }),
                      SizedBox(
                    height: 1.h,
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
                  SizedBox(
                    height: 1.h,
                  ),
                  DefaultTextFormField(
                    hint: 'ConFirm Password',
                    textEditingController: confirmPasswordController,
                    validator: (value) {
                      return null;
                    },
                    showSuffixIcon: true,
                    isPassword: true,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  DefaultElevetedButton(
                    title: "Sign Un",
                    onPressed: () {},
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("I already have an account ?"),
                      TextButton(
                        onPressed: () {
                          Navigators.naviagteReplacementTo(
                              context, LoginPage());
                        },
                        child: Text('Sign In'),
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

  /// method helpers

    AppBar signUpAppBar(BuildContext context) {
      return AppBar(
        title: Text('Sign Up',
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
