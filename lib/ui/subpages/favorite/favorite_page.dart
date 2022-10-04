import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:uccd_flutter/core/style/themes.dart';
import 'package:uccd_flutter/core/widgets/local/cart_product.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

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
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return CartProduct(inFavorite: true,);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
