import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sizer/sizer.dart';
import 'package:uccd_flutter/core/style/colors.dart';
import 'package:uccd_flutter/core/style/themes.dart';
import 'package:uccd_flutter/core/widgets/global/categories_list.dart';
import 'package:uccd_flutter/core/widgets/global/default_text_form_field.dart';
import 'package:uccd_flutter/core/widgets/local/popluar_deal.dart';

class AllProductsPage extends StatefulWidget {
  const AllProductsPage({super.key});

  @override
  State<AllProductsPage> createState() => _AllProductsPageState();
}

class _AllProductsPageState extends State<AllProductsPage> {
  late TextEditingController searchController;
  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarPage(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
          child: Column(
            children: [
              DefaultTextFormField(
                hint: 'Search',
                validator: null,
                controller: searchController,
                isPassword: false,
                showprefixIcon: true,
                prefixIcon: Icons.search,
              ),
              SizedBox(height: 4.h),
              CategoriesList(),
              SizedBox(height: 4.h),
              Expanded(
                child: GridView.custom(
                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverWovenGridDelegate.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    pattern: [
                      WovenGridTile(0.8, crossAxisRatio: 1),
                      WovenGridTile(
                        0.9,
                        crossAxisRatio: 1,
                        alignment: AlignmentDirectional.bottomCenter,
                      ),
                    ],
                  ),
                  childrenDelegate: SliverChildBuilderDelegate(
                    (context, index) => PopularDeal(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar appBarPage() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        'Products',
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
