import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:steps_indicator/steps_indicator.dart';
import 'package:uccd_flutter/core/resources/app_assets.dart';
import 'package:uccd_flutter/core/style/colors.dart';
import 'package:uccd_flutter/core/style/themes.dart';

class OngoingOrder extends StatefulWidget {
  const OngoingOrder({super.key});

  @override
  State<OngoingOrder> createState() => _OngoingOrderState();
}

class _OngoingOrderState extends State<OngoingOrder> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "March 5, 2021",
              style: AppStyle.brawnText,
            ),
            Spacer(),
            Text('6:30 PM',style: TextStyle(color: AppColors.orange,fontSize: 10.sp),),
          ],
        ),
        SizedBox(
          height: 6.h,
        ),
        Row(
          children: [
            OwnStepIndicator(
              currentIndex: 1,
            ),
            SizedBox(
              width: 6.w,
            ),
            SizedBox(
              // TODO: try
              // make the height of column same with parent (row)
              height: 16.h * 3,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _StepWidget(
                    title: "We are Pickin you items",
                    image: AppAssets.pickItem,
                  ),
                  _StepWidget(
                    title: "Your order is delivering",
                    image: AppAssets.scooter,
                  ),
                  _StepWidget(
                    title: "Your order is received.",
                    image: AppAssets.recieve,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _StepWidget extends StatelessWidget {
  final String title;
  final String image;
  const _StepWidget({
    Key? key,
    required this.title,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          image,
          height: 60,
          width: 60,
          fit: BoxFit.fill,
        ),
        SizedBox(
          width: 3.w,
        ),
        Text(
          title,
          style: AppStyle.brawnText,
          
          // overflow: TextOverflow.clip,
        ),
      ],
    );
  }
}

class OwnStepIndicator extends StatelessWidget {
  final int currentIndex;
  const OwnStepIndicator({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StepsIndicator(
      selectedStep: currentIndex,
      nbSteps: 3,
      doneLineColor: AppColors.orange,
      undoneLineColor: Colors.black38,
      isHorizontal: false,
      lineLength: 16.h,
      doneStepWidget: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: AppColors.orange,
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.orange),
        ),
        child: Icon(
          Icons.done,
          color: AppColors.white,
        ),
      ),
      selectedStepWidget: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: AppColors.orange,
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.orange),
        ),
        child: Icon(
          Icons.done,
          color: AppColors.white,
        ),
      ),
      unselectedStepWidget: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: AppColors.white,
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.orange),
        ),
      ),
    );
  }
}
