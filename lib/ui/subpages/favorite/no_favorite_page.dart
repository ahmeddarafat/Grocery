import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:uccd_flutter/core/resources/app_assets.dart';
import 'package:uccd_flutter/core/style/themes.dart';
import 'package:uccd_flutter/core/widgets/global/default_eleveted_button.dart';

class NoFavoritePage extends StatelessWidget {
  const NoFavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
            child: Column(
              children: [
                Text(
                  'Favorite',
                  style: AppStyle.headline1Orange,
                ),
                SizedBox(
                  height: 4.h,
                ),
                Center(
                    child: SizedBox(
                        height: 45.h,
                        child: SvgPicture.asset(
                          AppAssets.favorite,
                          fit: BoxFit.contain,
                        ))),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  "You Favorite is Empty",
                  style: AppStyle.headline1Brawn,
                ),
                SizedBox(
                  height: 1.h,
                ),
                SizedBox(
                  width: 60.w,
                  child: Text(
                    "Start fall in love & Go Shopping with some good goods",
                    style: AppStyle.subtitle1,
                    textAlign: TextAlign.center,
                  ),
                ),
                Spacer(),
                DefaultElevetedButton(
                    title: "Go Shopping",
                    onPressed: () {
                      // TODO: add
                      // navigators
                    })
              ],
            )));
  }
}
