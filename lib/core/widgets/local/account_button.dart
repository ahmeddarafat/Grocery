import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:uccd_flutter/core/style/colors.dart';
import 'package:uccd_flutter/core/style/themes.dart';

class AccountButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final IconData? suffixIcon;
  final Color iconColor;
  final String lang;
  final Widget notiWidget;

  final void Function()? ontap;
  const AccountButton({
    Key? key,
    required this.title,
    required this.icon,
    this.ontap,
    this.iconColor = AppColors.orange,
    this.suffixIcon,
    this.lang = "",
     this.notiWidget = const SizedBox(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.5.h),
        child: Row(
          children: [
            Icon(
              icon,
              color: iconColor,
              size: 40,
            ),
            SizedBox(
              width: 6.w,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.brawn,
                  fontWeight: FontWeight.w500),
            ),
            Spacer(),
            Text(
              lang,
              style: AppStyle.brawnText,
            ),
            Icon(
              suffixIcon,
              color: AppColors.brawn,
            ),
            notiWidget,
          ],
        ),
      ),
    );
  }
}
