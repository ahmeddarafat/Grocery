import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:uccd_flutter/core/resources/constants_variables.dart';
import 'package:uccd_flutter/core/style/colors.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({Key? key}) : super(key: key);

  @override
  CategoriesListState createState() => CategoriesListState();
}
class CategoriesListState extends State<CategoriesList> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        height: 40,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoriesList.length,
            itemBuilder: (_, index) {
              return buildCategory(index);
            }),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: (){
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categoriesList[index],
              style: TextStyle(
                // fontWeight: FontWeight.bold,
                fontSize: 14.sp,
                color: AppColors.brawn
              ),
            ),
            const SizedBox(height: 5,),
            Container(
              height: 2,
              width: 50,
              color: selectedIndex == index ? AppColors.orange:Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
