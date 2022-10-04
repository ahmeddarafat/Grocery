import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:uccd_flutter/core/resources/navigators.dart';
import 'package:uccd_flutter/core/style/colors.dart';
import 'package:uccd_flutter/core/style/themes.dart';
import 'package:uccd_flutter/core/widgets/local/account_button.dart';
import 'package:uccd_flutter/ui/subpages/account/profile/profile_page.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        child: Column(
          children: [
            Text(
              'Account',
              style: AppStyle.headline1Orange,
            ),
            SizedBox(
              height: 8.h,
            ),
            AccountButton(
              title: 'Profile',
              icon: Icons.person,
              ontap: () => Navigators.naviagteTo(context, ProfilePage()),
            ),
            AccountButton(
              title: 'Order',
              icon: Icons.offline_bolt,
            ),
            AccountButton(
              title: 'Adress',
              icon: Icons.location_on,
            ),
            AccountButton(
              title: 'Payments',
              icon: Icons.payment,
            ),
          ],
        ),
      ),
    );
  }
}
