import 'package:flutter/material.dart';

class CoffeeType extends StatelessWidget {
  final String coffeeName;
  final bool isSelected;
  const CoffeeType({
    required this.coffeeName,
    required this.isSelected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      coffeeName,
      style: TextStyle(
        color: isSelected ? Colors.orange : Colors.grey,
        fontSize: isSelected ? 18 : 16,
        fontWeight: isSelected ? FontWeight.bold : null,
      ),
    );
  }
}

List<String> coffeeNames = [
  'Cappuccino',
  'Espresso',
  'Latte',
  'Americano',
  'Filtered',
];
