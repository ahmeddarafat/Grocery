import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:uccd_flutter/core/resources/navigators.dart';
import 'package:uccd_flutter/core/style/themes.dart';
import 'package:uccd_flutter/core/widgets/local/category.dart';
import 'package:uccd_flutter/core/widgets/global/default_text_form_field.dart';
import 'package:uccd_flutter/data/models/categories_model.dart';
import 'package:uccd_flutter/data/providers/remote/dio_helper.dart';
import 'package:uccd_flutter/data/providers/remote/end_points.dart';
import 'package:uccd_flutter/ui/subpages/categories/all_products_page.dart';

class AllCategoriesPage extends StatefulWidget {
  const AllCategoriesPage({super.key});

  @override
  State<AllCategoriesPage> createState() => _AllCategoriesPageState();
}

class _AllCategoriesPageState extends State<AllCategoriesPage> {
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

  Future<CategoriesModel> getCategories() async {
    final Response response =
        await DioHelper.getData(url: EndPoints.categories);
    return CategoriesModel.fromJson(response.data);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        child: FutureBuilder(
            future: getCategories(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                case ConnectionState.none:
                case ConnectionState.active:
                case ConnectionState.done:
                default:
                  if (snapshot.hasData) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Categores',
                          style: AppStyle.headline1Orange,
                        ),
                        SizedBox(height: 4.h),
                        DefaultTextFormField(
                          hint: 'Search',
                        validator: null,
                          controller: searchController,
                          isPassword: false,
                          showprefixIcon: true,
                          prefixIcon: Icons.search,
                        ),
                        SizedBox(height: 4.h),
                        Expanded(
                          // TODO: Understand
                          // need more understand to gridView
                          child: GridView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: 8,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 2.h,
                                    mainAxisExtent: 20.h),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigators.naviagteTo(
                                      context, AllProductsPage());
                                },
                                child: Category(
                                  id: snapshot.data!.data![index].id,
                                  name: snapshot.data!.data![index].name!,
                                  image: snapshot.data!.data![index].image!,
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    );
                  } else {
                    // TODO: Add
                    // small local database to view the last data he got
                    // in case no network
                    return Center(
                      child: Text('No data'),
                    );
                  }
              }
            }),
      ),
    );
  }
}
