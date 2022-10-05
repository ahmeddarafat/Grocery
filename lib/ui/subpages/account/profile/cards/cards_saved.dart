import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:uccd_flutter/core/resources/app_assets.dart';
import 'package:uccd_flutter/core/resources/navigators.dart';
import 'package:uccd_flutter/core/style/colors.dart';
import 'package:uccd_flutter/core/style/themes.dart';
import 'package:uccd_flutter/core/widgets/local/account_button.dart';
import 'package:uccd_flutter/ui/subpages/account/profile/cards/new_card.dart';

class CardsSaved extends StatelessWidget {
  const CardsSaved({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarPage(context),
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 8.h),
              child: Column(
                children: [
                  CardButton(
                    title: "My Card",
                    subtitle: "4323 **** **** 3432",
                    url: AppAssets.visaPay,
                    suffixIcon: Icons.arrow_forward_ios_outlined,
                  ),
                  CardButton(
                    title: "My Card",
                    subtitle: "4323 **** **** 3432",
                    url: AppAssets.visaPay,
                    suffixIcon: Icons.arrow_forward_ios_outlined,
                  ),
                  CardButton(
                    title: "Apple Pay",
                    subtitle: "",
                    url: AppAssets.applePay,
                    suffixIcon: Icons.done,
                    iconColor: AppColors.orange,
                  ),
                ],
              ),),),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>Navigators.naviagteTo(context, NewCardPage()),
        backgroundColor: AppColors.orange,
        foregroundColor: AppColors.white,
        child: Icon(Icons.add),
      ),
    );
  }

  AppBar appBarPage(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        'My Cards',
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
