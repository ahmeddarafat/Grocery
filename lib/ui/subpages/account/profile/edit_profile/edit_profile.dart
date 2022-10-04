import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:uccd_flutter/core/style/colors.dart';
import 'package:uccd_flutter/core/style/themes.dart';
import 'package:uccd_flutter/core/widgets/global/default_eleveted_button.dart';
import 'package:uccd_flutter/core/widgets/global/default_text_form_field.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late final TextEditingController nameController;
  late final TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
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
                hint: "Name",
                controller: nameController,
                validator: (name) {
                  if (name!.isNotEmpty) {
                    return null;
                  }
                  return "please Enter your name";
                },
              ),
              SizedBox(
                height: 4.h,
              ),
              DefaultTextFormField(
                hint: "Phone",
                controller: nameController,
                validator: (phone) {
                  if (phone!.length > 10) {
                    return null;
                  }
                  return "please Enter your name";
                },
              ),
              Spacer(),
              DefaultElevetedButton(title: "Update Profile", onPressed: () {})
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
