import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade900,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: '   Find Your Coffee...',
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey,
                size: 28,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
