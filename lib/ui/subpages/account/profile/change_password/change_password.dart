import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:uccd_flutter/core/style/colors.dart';
import 'package:uccd_flutter/core/style/themes.dart';
import 'package:uccd_flutter/core/widgets/global/default_eleveted_button.dart';
import 'package:uccd_flutter/core/widgets/global/default_outline_button.dart';
import 'package:uccd_flutter/core/widgets/global/default_text_form_field.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  late final TextEditingController oldPassController;
  late final TextEditingController newPassController;
  late final TextEditingController confirmPassController;

  @override
  void initState() {
    super.initState();
    oldPassController = TextEditingController();
    newPassController = TextEditingController();
    confirmPassController = TextEditingController();
  }

  @override
  void dispose() {
    oldPassController.dispose();
    newPassController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBarPage(context),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
          child: Column(
            children: [
              SizedBox(
                height: 8.h,
              ),
              DefaultTextFormField(
                hint: "Old Password",
                controller: oldPassController,
                validator: (_) {
                  return null;
                },
                isPassword: true,
                showSuffixIcon: true,
                showprefixIcon: true,
                prefixIcon: Icons.lock,
              ),
              SizedBox(
                height: 4.h,
              ),
              DefaultTextFormField(
                hint: "New Password",
                controller: newPassController,
                validator: (_) {
                  return null;
                },
                isPassword: true,
                showSuffixIcon: true,
                showprefixIcon: true,
                prefixIcon: Icons.lock,
              ),
              SizedBox(
                height: 4.h,
              ),
              DefaultTextFormField(
                hint: "Confirm Password",
                controller: confirmPassController,
                validator: (_) {
                  return null;
                },
                isPassword: true,
                showSuffixIcon: true,
                showprefixIcon: true,
                prefixIcon: Icons.lock,
              ),
              Spacer(),
              DefaultElevetedButton(title: "Confirm", onPressed: () {}),
              SizedBox(
                height: 2.h,
              ),
              DefaultOutlineButton(
                title: "Back To Sign In",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar appBarPage(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        'Edit Profile',
        style: AppStyle.headline1Orange,
      ),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: AppColors.orange,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
