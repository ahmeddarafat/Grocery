import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:uccd_flutter/core/resources/app_assets.dart';
import 'package:uccd_flutter/core/style/colors.dart';
import 'package:uccd_flutter/core/style/themes.dart';
import 'package:uccd_flutter/core/widgets/global/default_eleveted_button.dart';

class NoCardsPage extends StatelessWidget {
  const NoCardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarPage(context),
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
              child: Column(
                children: [
                  Center(
                      child: SizedBox(
                          height: 45.h,
                          child: SvgPicture.asset(
                            AppAssets.noCards,
                            fit: BoxFit.contain,
                          ))),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    "No Cards Saved",
                    style: AppStyle.headline1Brawn,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  SizedBox(
                    width: 60.w,
                    child: Text(
                      "You can save your card info to make purchase easier, faster.",
                      style: AppStyle.subtitle1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),),),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
