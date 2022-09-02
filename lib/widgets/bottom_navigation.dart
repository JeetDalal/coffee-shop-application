import 'package:flutter/material.dart';

class BNavigtionBar extends StatelessWidget {
  const BNavigtionBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 5,
      backgroundColor: Colors.black.withOpacity(0.5),
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Colors.orange,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag_sharp),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: '',
        ),
      ],
    );
  }
}
