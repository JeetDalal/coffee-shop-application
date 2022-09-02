import 'package:coffeeapp/widgets/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/bottom_navigation.dart';
import '../widgets/coffee_card.dart';
import '../widgets/menu_icon.dart';
import '../widgets/otherwise_text.dart';
import '../widgets/search_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isSelected = false;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BNavigtionBar(),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 40,
                ),
                child: Row(
                  children: const [
                    MenuIcon(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.grey,
                      ),
                    ),
                    Spacer(),
                    MenuIcon(
                      icon: Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Text(
                  'Find the best\ncoffee for you',
                  style: GoogleFonts.poppins(
                    fontSize: 35,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 35,
                ),
                child: SearchBox(),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: SizedBox(
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(coffeeNames.length, (index) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: index != selectedIndex
                                ? CoffeeType(
                                    coffeeName: coffeeNames[index],
                                    isSelected: _isSelected,
                                  )
                                : OtherwiseText(
                                    selectedIndex: selectedIndex,
                                  ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  // scrollDirection: Axis.horizontal,
                  children: [
                    CoffeeCard(
                      id: DateTime.now().toString(),
                      selectedIndex: selectedIndex,
                      description: 'with Oat Milk',
                      imageUrl: 'images/coffee1.jpg',
                      price: ' 4.99',
                    ),
                    CoffeeCard(
                      id: DateTime.now().toString(),
                      selectedIndex: selectedIndex,
                      description: 'with Chocolate',
                      imageUrl: 'images/coffee2.jpg',
                      price: ' 3.99',
                    ),
                    CoffeeCard(
                      id: DateTime.now().toString(),
                      selectedIndex: selectedIndex,
                      description: 'with Caramel',
                      imageUrl: 'images/coffee3.jpg',
                      price: ' 3.99',
                    ),
                    CoffeeCard(
                      id: DateTime.now().toString(),
                      selectedIndex: selectedIndex,
                      description: 'with no Milk',
                      imageUrl: 'images/coffee4.jpg',
                      price: ' 3.99',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
