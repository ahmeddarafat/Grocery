import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:uccd_flutter/core/resources/app_assets.dart';
import 'package:uccd_flutter/core/style/colors.dart';
import 'package:uccd_flutter/core/style/themes.dart';

class HistoryOrder extends StatelessWidget {
  const HistoryOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 4,
      separatorBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Divider(
            color: AppColors.grey,
            thickness: 3,
          ),
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return OrderHistoryWidget();
      },
    );
  }
}

class OrderHistoryWidget extends StatelessWidget {
  // final double orderNumber;
  // final bool isDelivered;
  // final String name;
  // final double price;
  const OrderHistoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          AppAssets.cart,
          color: AppColors.orange,
          height: 40,
          width: 40,
          fit: BoxFit.fill,
        ),
        SizedBox(
          width: 4.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Order #423",
              style: AppStyle.brawnText,
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              "Delivered",
              style: TextStyle(color: Colors.green, fontSize: 10.sp),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text("October 12, 2022", style: AppStyle.subtitle2Brawn),
          ],
        ),
        Spacer(),
        Text(
          "\$734",
          style: AppStyle.headline2Orange,
        ),
      ],
    );
  }
}
