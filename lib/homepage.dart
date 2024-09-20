import 'package:flutter/material.dart';
import 'package:shoppingapp/pages/cart.dart';
import 'package:shoppingapp/pages/home.dart';
import 'package:shoppingapp/pages/login.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Widget> pages = const [Home(), CartDetails(), Login()];
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 12,
          unselectedFontSize: 12,
          iconSize: 35,
          onTap: (value) {
            setState(() {
              currentPage = value;
            });
          },
          selectedItemColor: Colors.yellow[700],
          currentIndex: currentPage,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_rounded), label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
          ],
        ),
        body: IndexedStack(index: currentPage, children: pages));
  }
}
