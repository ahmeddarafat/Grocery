import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Learn extends StatelessWidget {
  const Learn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Center',style: TextStyle(fontSize: 50.sp),),
            SizedBox(height: 5.h,),
            Text('Center',style: TextStyle(fontSize: 50),),
          ],
        ),
      ),
    );
  }
}