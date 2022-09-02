import 'package:flutter/material.dart';

class MenuIcon extends StatelessWidget {
  final Icon icon;
  const MenuIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(
              0.12,
            ),
            // offset: const Offset(-2, -2),
          ),
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      child: icon,
    );
  }
}
//  const Icon(
//         Icons.menu,
//         color: Colors.grey,
//       ),