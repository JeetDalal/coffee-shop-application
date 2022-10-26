import 'package:coffeeapp/provider/coffee_provider.dart';
import 'package:coffeeapp/widgets/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
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
    final coffeeList = Provider.of<CoffeeProvider>(context).coffeeItem;

    return Scaffold(
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
              SizedBox(
                height: 450,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: coffeeList.length,
                  itemBuilder: (context, index) {
                    return CoffeeCard(
                      coffeeName: coffeeList[index].coffeeName,
                      id: coffeeList[index].id,
                      description: coffeeList[index].description,
                      imageUrl: coffeeList[index].imageUrl,
                      price: '  ' + coffeeList[index].price.toString(),
                      selectedIndex: selectedIndex,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
