import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:uccd_flutter/core/resources/constants_variables.dart';
import 'package:uccd_flutter/core/style/colors.dart';
import 'package:uccd_flutter/core/style/themes.dart';
import 'package:uccd_flutter/core/widgets/global/categories_list.dart';
import 'package:uccd_flutter/ui/subpages/account/order/history_order.dart';
import 'package:uccd_flutter/ui/subpages/account/order/ongoing_order.dart';

class OrderLayouts extends StatelessWidget {
  const OrderLayouts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarPage(context),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
          child: Column(children: [
            SizedBox(height: 6.h,),
            CategoriesList2(
              list: orderList,
            ),
            SizedBox(height: 4.h,),
            // Expanded(child: HistoryOrder()),
            OngoingOrder(),
          ]),
        ),
      ),
    );
  }

  AppBar appBarPage(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        'Order',
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
