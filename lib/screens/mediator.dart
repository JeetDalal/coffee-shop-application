import 'package:coffeeapp/widgets/bottom_navigation.dart';
import 'package:custom_navigator/custom_navigation.dart';
import 'package:flutter/material.dart';

import 'cart_screen.dart';
import 'home_page.dart';

class Mediate extends StatefulWidget {
  const Mediate({super.key});

  @override
  State<Mediate> createState() => _MediateState();
}

class _MediateState extends State<Mediate> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      HomePage(),
      CartScreen(),
    ];
    return CustomScaffold(
      scaffold: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              this.index = index;
            });
          },
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.blueGrey.shade900,
          currentIndex: index,
          elevation: 5,
          backgroundColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 32,
                // color: Colors.blueGrey.shade900,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                size: 30,
                Icons.shopping_bag_sharp,
                // color: Colors.blueGrey.shade900,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                size: 30,
                Icons.favorite,
                // color: Colors.blueGrey.shade900,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                size: 30,
                Icons.location_history,
                // color: Colors.blueGrey.shade900,
              ),
              label: '',
            ),
          ],
        ),
        body: pages[index],
      ),
    );
  }
}
