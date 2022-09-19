import 'package:flutter/material.dart';

class FrequentProducts extends StatelessWidget {
  const FrequentProducts({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            imageUrl,
          ),
        ),
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
      ),
      height: 130,
      width: 100,
    );
  }
}
