import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:uccd_flutter/core/resources/navigators.dart';
import 'package:uccd_flutter/core/style/colors.dart';
import 'package:uccd_flutter/core/style/themes.dart';
import 'package:uccd_flutter/core/widgets/local/account_button.dart';
import 'package:uccd_flutter/ui/subpages/account/profile/cards/cards_saved.dart';
import 'package:uccd_flutter/ui/subpages/account/profile/cards/no_cards_page.dart';
import 'package:uccd_flutter/ui/subpages/account/profile/change_password/change_password.dart';
import 'package:uccd_flutter/ui/subpages/account/profile/edit_profile/edit_profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarPage(context),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 8.h,
              ),
              AccountButton(
                title: 'Edit Profile',
                icon: Icons.person,
                iconColor: AppColors.brawn,
                suffixIcon: Icons.arrow_forward_ios_outlined,
                ontap: () => Navigators.naviagteTo(context, EditProfilePage()),
              ),
              AccountButton(
                title: 'Change Password',
                icon: Icons.password,
                iconColor: AppColors.brawn,
                suffixIcon: Icons.arrow_forward_ios_outlined,
                ontap: () =>
                    Navigators.naviagteTo(context, ChangePasswordPage()),
              ),
              AccountButton(
                title: 'My Cards',
                icon: Icons.payment,
                iconColor: AppColors.brawn,
                suffixIcon: Icons.arrow_forward_ios_outlined,
                ontap: () =>
                    Navigators.naviagteTo(context, CardsSaved()),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "App Settings",
                  style: AppStyle.headline1Orange,
                ),
              ),
              AccountButton(
                title: 'Notifications',
                icon: Icons.notifications,
                iconColor: AppColors.brawn,
                notiWidget: CupertinoSwitch(
                  value: true,
                  activeColor: AppColors.orange,
                  onChanged: (value) {},
                ),
              ),
              AccountButton(
                title: 'Language',
                icon: Icons.language_outlined,
                iconColor: AppColors.brawn,
                lang: 'English',
                suffixIcon: Icons.arrow_forward_ios_outlined,
              ),
              AccountButton(
                title: 'Logout',
                icon: Icons.logout,
                iconColor: AppColors.brawn,
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
        'Profile',
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
