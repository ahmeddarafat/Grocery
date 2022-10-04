import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:uccd_flutter/core/resources/app_assets.dart';
import 'package:uccd_flutter/core/style/colors.dart';
import 'package:uccd_flutter/core/style/themes.dart';

class CartProduct extends StatelessWidget {
  final bool inFavorite;
  const CartProduct({
    Key? key,  this.inFavorite = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      // TODO: understand
      // the types of keys
      key: UniqueKey(),
      background: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        margin: EdgeInsets.symmetric(vertical: 4.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.red,
        ),
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.delete,
              color: Colors.white,
              size: 40,
            ),
            const Icon(
              Icons.delete,
              color: Colors.white,
              size: 40,
            ),
          ],
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: SizedBox(
              height: 100,
              child: Row(
                children: [
                  Expanded(child: Image.asset(AppAssets.apple)),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Red Apple",
                          style: AppStyle.brawnText,
                        ),
                      !inFavorite? NoOfProductRow(
                          height: 4.h,
                          horizontalPadding: 0,
                          widget: 30.w,
                        ): _TextButton() ,
                      ],
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(text: "\$3.00 ", style: AppStyle.subtitle1),
                          TextSpan(
                              text: "kg",
                              style: TextStyle(color: AppColors.brawn)),
                        ]),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Divider(
            color: AppColors.grey,
            thickness: 2,
          ),
        ],
      ),
    );
  }
}

class NoOfProductRow extends StatelessWidget {
  final double height;
  final double? widget;
  final double horizontalPadding;
  const NoOfProductRow({
    Key? key,
    required this.height,
    required this.horizontalPadding,
    this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      height: height + 1.h,
      width: widget,
      decoration: BoxDecoration(
        color: Color(0xffF4F4F4),
        borderRadius: BorderRadius.circular(64),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                minimumSize: Size(0, height),
                backgroundColor: AppColors.white,
                shape: CircleBorder()),
            child: Icon(
              Icons.add,
              color: AppColors.brawn,
            ),
          ),
          Text(
            '2',
            style: AppStyle.brawnText,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                minimumSize: Size(0, height),
                backgroundColor: AppColors.white,
                shape: CircleBorder()),
            child: Icon(
              Icons.add,
              color: AppColors.brawn,
            ),
          ),
        ],
      ),
    );
  }
}

class _TextButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // TODO: ADD & Action
        // Action
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppAssets.cart,height: 30,width: 30,fit: BoxFit.fill,),
          Text(
            " Add To Cart",
            style: AppStyle.orangeText,
          ),
        ],
      ),
    );
  }
}
