import 'package:flutter/material.dart';
import 'package:uccd_flutter/core/style/colors.dart';
import 'package:uccd_flutter/ui/home/shop_page.dart';

class OwnBottomNavigationBar extends StatefulWidget {
  const OwnBottomNavigationBar({super.key});

  @override
  State<OwnBottomNavigationBar> createState() => _OwnBottomNavigationBarState();
}

class _OwnBottomNavigationBarState extends State<OwnBottomNavigationBar> {
  List<Widget> screens =[
    ShopPage(),
    ShopPage(),
    ShopPage(),
    ShopPage(),
    ShopPage(),
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: AppColors.brawn,
        onTap: (index)=>setState(() {
          currentPage = index;
        }),
       items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: 'home'),
        BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Explore'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: 'Cart'),
        BottomNavigationBarItem(icon: Icon(Icons.heart_broken),label: 'Favorite'),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Account'),
       ],
      ),
    );
  }
}