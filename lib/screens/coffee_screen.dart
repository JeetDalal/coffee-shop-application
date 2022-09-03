import 'dart:ui';

import 'package:coffeeapp/provider/coffee_provider.dart';
import 'package:coffeeapp/widgets/menu_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/size_determiner.dart';

class CoffeeScreen extends StatefulWidget {
  const CoffeeScreen({Key? key}) : super(key: key);

  @override
  State<CoffeeScreen> createState() => _CoffeeScreenState();
}

class _CoffeeScreenState extends State<CoffeeScreen> {
  int currentIndex = 0;
  List<String> valueList = ['S', 'M', 'L'];
  String showStatus = 'show more...';
  bool _isPressed = false;
  double containerHeight = 20;
  @override
  Widget build(BuildContext context) {
    final prodId = ModalRoute.of(context)!.settings.arguments as String;
    final prodList = Provider.of<CoffeeProvider>(context).coffeeItem;
    final coffee = prodList.firstWhere((element) => element.id == prodId);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Center(
                  child: Image.asset(
                    coffee.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 35,
                      vertical: 30,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: const MenuIcon(
                            icon: Icon(
                              Icons.arrow_back,
                            ),
                          ),
                        ),
                        GestureDetector(
                          child: const MenuIcon(
                            icon: Icon(
                              Icons.favorite,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.09),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 40, top: 20, bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Text(
                                      coffee.coffeeName,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    coffee.description,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 40, top: 20, bottom: 20),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          coffee.rating.toString(),
                                          style: const TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Icon(
                                          Icons.star,
                                          color: Colors.orange,
                                        ),
                                      ],
                                    ),
                                    Text(coffee.totalRating),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: Container(
                  width: double.infinity,
                  height: 400,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Description',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: _isPressed ? 120 : 30,
                        // width: MediaQuery.of(context).size.width,
                        child: Text(
                          coffee.briefDescription,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (showStatus == 'show more...') {
                            setState(() {
                              _isPressed = true;
                              showStatus = 'show less...';
                            });
                          } else {
                            setState(() {
                              _isPressed = false;
                              showStatus = 'show more...';
                            });
                          }
                        },
                        child: Text(
                          _isPressed ? 'show less...' : 'show more...',
                          style: const TextStyle(
                            color: Colors.orange,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          children: List.generate(
                            3,
                            (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    currentIndex = index;
                                  });
                                },
                                child: index == currentIndex
                                    ? SizeDeterminer(
                                        value: valueList[index],
                                        borderColor: Colors.orange,
                                        color: Colors.orange,
                                      )
                                    : SizeDeterminer(
                                        value: valueList[index],
                                        color: Colors.grey,
                                        borderColor: Colors.transparent,
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const Text(
                                'Price',
                                style: TextStyle(color: Colors.grey),
                              ),
                              Row(
                                children: [
                                  const Text(
                                    '\$',
                                    style: TextStyle(
                                      color: Colors.orange,
                                      fontSize: 25,
                                    ),
                                  ),
                                  Text(
                                    coffee.price.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: TextButton(
                              onPressed: () {},
                              child: Container(
                                height: 50,
                                // color: Colors.white,
                                width: 250,
                                // height: 35,
                                decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Center(
                                  child: Text(
                                    'BUY NOW',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
