import 'package:flutter/material.dart';

class SizeDeterminer extends StatelessWidget {
  final String value;
  final Color borderColor;
  final Color color;
  const SizeDeterminer({
    required this.value,
    required this.color,
    required this.borderColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: borderColor,
        ),
      ),
      child: Center(
        child: Text(
          value,
          style: TextStyle(
            color: color,
          ),
        ),
      ),
    );
  }
}
