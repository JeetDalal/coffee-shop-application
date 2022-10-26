import 'package:flutter/material.dart';
import 'cart_screen.dart';
import 'home_page.dart';

class Mediate extends StatefulWidget {
  const Mediate({super.key});

  @override
  State<Mediate> createState() => _MediateState();
}

class _MediateState extends State<Mediate> {
  PageController _pageController = PageController();
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            this.index = index;
          });
          _pageController.animateToPage(
            index,
            duration: const Duration(
              milliseconds: 200,
            ),
            curve: Curves.easeIn,
          );
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
      body: PageView(
        controller: _pageController,
        children: [
          HomePage(),
          CartScreen(),
        ],
      ),
    );
  }
}
