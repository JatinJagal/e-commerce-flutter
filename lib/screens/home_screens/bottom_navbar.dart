import 'package:e_commerce/providers/product_provider.dart';
import 'package:e_commerce/screens/home_screens/cart_screen.dart';
import 'package:e_commerce/screens/home_screens/category_screen.dart';
import 'package:e_commerce/screens/home_screens/notification_screen.dart';
import 'package:e_commerce/screens/home_screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedIndex = 0;

  final textList = const [
    CategoryScreen(),
    CartScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProductProvider>().getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: textList.elementAt(_selectedIndex),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black, blurRadius: 28, offset: Offset(10, 10))
              ],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24), topRight: Radius.circular(24))),
          child: GNav(
              haptic: true,
              tabBorderRadius: 24,
              // curve: Curves.easeOutExpo,
              duration: const Duration(milliseconds: 200),
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              gap: 4,
              tabBackgroundColor: Colors.grey.shade300,
              selectedIndex: _selectedIndex,
              onTabChange: (value) {
                setState(() {
                  _selectedIndex = value;
                });
              },
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: "Home",
                ),
                GButton(
                  icon: Icons.shopping_cart,
                  text: "Cart",
                ),
                GButton(
                  icon: Icons.notifications,
                  text: "Notification",
                ),
                GButton(
                  icon: Icons.person_pin,
                  text: "People",
                )
              ]),
        ));
  }
}
