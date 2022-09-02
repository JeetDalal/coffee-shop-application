import 'package:coffeeapp/widgets/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeeCard extends StatelessWidget {
  final String id;
  final String description;
  final String imageUrl;
  final String price;
  const CoffeeCard({
    required this.id,
    required this.description,
    required this.imageUrl,
    required this.price,
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 35,
        vertical: 20,
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed('/coffee-screen', arguments: id);
        },
        child: Container(
          height: 400,
          width: 180,
          // color: Colors.blue,
          decoration: BoxDecoration(
            color: Colors.blueGrey.shade900,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        imageUrl,
                      ),
                    ),
                    // color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                child: Center(
                  child: Text(
                    coffeeNames[selectedIndex],
                    style: GoogleFonts.qwitcherGrypen(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  description,
                  style: const TextStyle(color: Colors.grey, fontSize: 15),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const Text(
                          '\$',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          price,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
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
