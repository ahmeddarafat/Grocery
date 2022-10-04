import 'package:flutter/material.dart';
import 'package:uccd_flutter/core/style/colors.dart';
import 'package:uccd_flutter/data/providers/local/cache_helper.dart';
import 'package:uccd_flutter/ui/main_pages/account_page.dart';
import 'package:uccd_flutter/ui/main_pages/all_categories_page.dart';
import 'package:uccd_flutter/ui/main_pages/cart_page.dart';
import 'package:uccd_flutter/ui/main_pages/home_page.dart';
import 'package:uccd_flutter/ui/subpages/favorite/favorite_page.dart';
import 'package:uccd_flutter/ui/subpages/favorite/no_favorite_page.dart';

class Layouts extends StatefulWidget {
  const Layouts({super.key});

  @override
  State<Layouts> createState() => _LayoutsState();
}

class _LayoutsState extends State<Layouts> {
  List<Widget> screens = [
    HomePage(),
    AllCategoriesPage(),
    CartPage(),
    NoFavoritePage(),
    AccountPage(),
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    print("the token of this email is ${CacheHelper.getString(key: 'token')}");
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: AppColors.brawn,
        onTap: (index) => setState(() {
          // TODO: bloc
          currentPage = index;
        }),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
      ),
    );
  }
}
