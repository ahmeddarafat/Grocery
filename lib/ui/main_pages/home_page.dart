import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:uccd_flutter/core/style/themes.dart';
import 'package:uccd_flutter/core/widgets/local/category.dart';
import 'package:uccd_flutter/core/widgets/local/offer.dart';
import 'package:uccd_flutter/core/widgets/local/popluar_deal.dart';
import 'package:uccd_flutter/data/models/categories_model.dart';
import 'package:uccd_flutter/data/providers/remote/dio_helper.dart';
import 'package:uccd_flutter/data/providers/remote/end_points.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Offer(),
                          SizedBox(
                            height: 4.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Categories',
                                style: AppStyle.headline1Brawn,
                              ),
                              TextButton(
                                  onPressed: () {
                                    // TODO: ADD
                                    // Navigators to all categories page
                                  },
                                  child: Text(
                                    'See All',
                                    style: AppStyle.orangeText,
                                  ))
                            ],
                          ),
                          SizedBox(height: 2.h),
                          SizedBox(
                            height: 180,
                            child: ListView.separated(
                              itemCount: 8,
                              scrollDirection: Axis.horizontal,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(
                                  width: 2.w,
                                );
                              },
                              itemBuilder: (BuildContext context, int index) {
                                return Category(
                                  id: snapshot.data!.data![index].id,
                                  name: snapshot.data!.data![index].name!,
                                  image: snapshot.data!.data![index].image!,
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Popular Deals',
                                style: AppStyle.headline1Brawn,
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'See All',
                                    style: AppStyle.orangeText,
                                  ))
                            ],
                          ),
                          SizedBox(height: 2.h),
                          SizedBox(
                            height: 240,
                            child: ListView.separated(
                              itemCount: 10,
                              scrollDirection: Axis.horizontal,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(
                                  width: 3.w,
                                );
                              },
                              itemBuilder: (BuildContext context, int index) {
                                return PopularDeal();
                              },
                            ),
                          ),
                        ],
                      ),
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
