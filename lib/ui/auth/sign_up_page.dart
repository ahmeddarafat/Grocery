// ignore_for_file: prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:uccd_flutter/core/resources/app_assets.dart';
import 'package:uccd_flutter/core/resources/navigators.dart';
import 'package:uccd_flutter/core/style/colors.dart';
import 'package:uccd_flutter/core/widgets/global/default_eleveted_button.dart';
import 'package:uccd_flutter/core/widgets/global/default_snack_bar.dart';
import 'package:uccd_flutter/core/widgets/global/default_text_form_field.dart';
import 'package:uccd_flutter/data/models/user_model.dart';
import 'package:uccd_flutter/data/providers/local/cache_helper.dart';
import 'package:uccd_flutter/data/providers/remote/dio_helper.dart';
import 'package:uccd_flutter/data/providers/remote/end_points.dart';
import 'package:uccd_flutter/ui/auth/login_page.dart';
import 'package:uccd_flutter/ui/main_pages/layouts.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  late final TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  Future<Response> register() async {
    final data = {
      "name": nameController.text,
      "email": emailController.text,
      "password": passwordController.text,
      "phone": phoneController.text,
    };
    final response =
        await DioHelper.postData(url: EndPoints.rigester, data: data);
    return response;
  }

  @override
  Widget build(BuildContext context) {
    print('the whole page is rebuilt');
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
                      child: SvgPicture.asset(AppAssets.signUP, height: 18.h)),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    'Hello !',
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        ?.copyWith(fontSize: 20.sp, letterSpacing: 3),
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
                    controller: nameController,
                    validator: (name) {
                      if (name!.isNotEmpty) {
                        return null;
                      }
                      return "Please Enter Your Name";
                    },
                    showprefixIcon: true,
                    prefixIcon: Icons.person,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  DefaultTextFormField(
                    hint: 'email',
                    controller: emailController,
                    keyboardtype: TextInputType.emailAddress,
                    validator: (email) {
                      if (email!.contains('@')) {
                        return null;
                      }
                      return 'Enter Correct Email';
                    },
                    showprefixIcon: true,
                    prefixIcon: Icons.email_outlined,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  DefaultTextFormField(
                    hint: 'Password',
                    controller: passwordController,
                    validator: (password) {
                      if (password!.length > 7) {
                        return null;
                      }
                      return "Weak Passward";
                    },
                    showSuffixIcon: true,
                    isPassword: true,
                    showprefixIcon: true,
                    prefixIcon: Icons.password,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  DefaultTextFormField(
                    hint: 'ConFirm Password',
                    controller: confirmPasswordController,
                    validator: (password) {
                      if (password!.length > 7 &&
                          password == passwordController.text) {
                        return null;
                      }
                      return "The password doesn't match";
                    },
                    showSuffixIcon: true,
                    isPassword: true,
                    showprefixIcon: true,
                    prefixIcon: Icons.password,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  DefaultTextFormField(
                    hint: 'Phone',
                    controller: phoneController,
                    keyboardtype: TextInputType.phone,
                    validator: (phone) {
                      if (phone!.length > 10) {
                        return null;
                      }
                      return "Wrong Phone Number";
                    },
                    showprefixIcon: true,
                    prefixIcon: Icons.phone,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  DefaultElevetedButton(
                    title: "Sign Up",
                    onPressed: () {
                      // TODO: Understand
                      // why I use ! here and when I can make currentState != null
                      if (_formKey.currentState!.validate()) {
                        register().then((response) {
                          if (response.statusCode == 200) {
                            UserModel user = UserModel.fromJson(response.data);
                            CacheHelper.setString(
                                key: "token", value: user.accessToken!);
                            Navigators.naviagteReplacementTo(
                                context, Layouts());
                          }
                        }).catchError((error) {
                          var message = error.message;
                          print(message);
                          DefaultSnackBar.error(
                              message: "The email has already been taken.",
                              color: AppColors.orange,
                              context: context);
                        });
                        // print("the rigester is completed");
                      }
                    },
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
