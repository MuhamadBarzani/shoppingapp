import 'package:flutter/material.dart';
import 'package:shoppingapp/pages/cart.dart';
import 'package:shoppingapp/pages/home.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Widget> pages = const [Home(), CartDetails()];
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 0,
          unselectedFontSize: 0,
          iconSize: 35,
          onTap: (value) {
            setState(() {
              currentPage = value;
            });
          },
          selectedItemColor: const Color.fromARGB(255, 241, 197, 0),
          currentIndex: currentPage,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket), label: "")
          ],
        ),
        body: IndexedStack(index: currentPage, children: pages));
  }
}
