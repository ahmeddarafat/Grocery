import 'package:flutter/material.dart';
import 'package:uccd_flutter/core/resources/app_assets.dart';
import 'package:uccd_flutter/core/style/colors.dart';
import 'package:uccd_flutter/core/style/themes.dart';

class PopularDeal extends StatelessWidget {
  const PopularDeal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      height: 220,
      width: 170,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: -3
          )
        ]
      ),
      child: Padding(padding: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(AppAssets.apple,width: double.infinity,height: 100,),
          Text('Red Apple',style: TextStyle(color: AppColors.brawn,fontSize: 23),),
          Text('1kg, pricing',style: TextStyle(color: Colors.grey,fontSize: 18),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$ 4,99',style: AppStyle.orangeText,),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green
                ),
                child: Icon(Icons.add,color: Colors.white,),
              )
            ],
          )
        
      ]),),
    );
  }
}


