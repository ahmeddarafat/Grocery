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
import 'package:uccd_flutter/ui/auth/sign_up_page.dart';
import 'package:uccd_flutter/ui/main_pages/layouts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  /// controllers
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<Response> login() async {
    final query = {
      "email": emailController.text,
      "password": passwordController.text,
    };
    final response =
        await DioHelper.postData(url: EndPoints.login, query: query);
    return response;
  }

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
                    controller: emailController,
                    // TODO: improve
                    // imporve validate
                    validator: (email) {
                      if (email != null && email.contains('@')) {
                        return null;
                      }
                      return 'Enter Correct Email';
                    },
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  DefaultTextFormField(
                    hint: 'Password',
                    controller: passwordController,
                    // TODO: improve
                    // imporve validate
                    validator: (password) {
                      if (password != null && password.length > 7) {
                        return null;
                      }
                      return "Weak Passward";
                    },
                    showSuffixIcon: true,
                    isPassword: true,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                        onPressed: () {
                          // TODO: ADD
                          // forget password
                        },
                        child: const Text("Forget Password?")),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  DefaultElevetedButton(
                      title: "Sign In",
                      onPressed: () {
                        // TODO: Understand
                        // why I use ! here and when I can make currentState != null
                        if (_formKey.currentState!.validate()) {
                          login().then((response) {
                            // TODO: Eidt
                            // need to handle the error of response
                            if (response.statusCode == 200) {
                              UserModel user =
                                  UserModel.fromJson(response.data);
                              CacheHelper.setString(
                                  key: "token", value: user.accessToken!);
                              Navigators.naviagteReplacementTo(
                                  context, Layouts());
                            }
                          }).catchError((error) {
                            // var message = error.message;
                            print("the error message: ${error.toString()}");
                            DefaultSnackBar.error(
                                message:
                                    "Data you entered not match our records",
                                color: AppColors.orange,
                                context: context);
                          });
                        }
                      }),
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
