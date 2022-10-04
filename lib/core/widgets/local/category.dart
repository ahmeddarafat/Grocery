import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:uccd_flutter/core/style/themes.dart';

class Category extends StatelessWidget {
  final int? id;
  final String name;
  final String image;
  const Category({
    Key? key,
    this.id,
    required this.name,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
            backgroundColor: Color(0xffEDD0FF),
            radius: 60,
            child: ClipRRect(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.network(
                image,
                fit: BoxFit.contain,
              ),
            )),
        SizedBox(
          height: 1.h,
        ),
        Text(
          name,
          style: AppStyle.subtitle1,
        )
      ],
    );
  }
}
