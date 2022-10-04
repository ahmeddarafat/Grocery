import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:uccd_flutter/core/resources/app_assets.dart';
import 'package:uccd_flutter/core/style/themes.dart';
import 'package:uccd_flutter/core/widgets/global/default_eleveted_button.dart';
import 'package:uccd_flutter/core/widgets/local/cart_product.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  height: 40.h,
                  width: 30.w,
                  child: Image.asset(AppAssets.apple, fit: BoxFit.contain),
                ),
              ),
              Text(
                "Red Apple",
                style: AppStyle.headline1Brawn,
              ),
              SizedBox(
                height: 1.h,
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: "\$3.00",
                    style: AppStyle.headline1Brawn,
                  ),
                  TextSpan(
                    text: " /st",
                    style: AppStyle.brawnText,
                  ),
                ]),
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                "Golden Ripe Alphonsa mangoes delivered to your house in the most hygenic way ever... Best for eating plain but can also be made into shakes and cakes.",
                style: AppStyle.subtitle1,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 4.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: NoOfProductRow(height: 8.h, horizontalPadding: 8,),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  IconButton(
                    icon: Icon(Icons.favorite_border_outlined),
                    iconSize: 50,
                    onPressed: () {},
                  ),
                ],
              ),
              Spacer(),
              DefaultElevetedButton(title: 'Add To Cart', onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}

