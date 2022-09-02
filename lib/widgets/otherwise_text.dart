import 'package:coffeeapp/widgets/coffee_type.dart';
import 'package:flutter/material.dart';

class OtherwiseText extends StatelessWidget {
  const OtherwiseText({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          coffeeNames[selectedIndex],
          style: const TextStyle(
            color: Colors.orange,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Icon(
          Icons.circle,
          color: Colors.orange,
          size: 10,
        ),
      ],
    );
  }
}
