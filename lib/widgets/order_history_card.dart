import 'dart:developer';

import 'package:coffeeapp/provider/cart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OrderHistoryCard extends StatefulWidget {
  OrderHistoryCard({
    Key? key,
  }) : super(key: key);

  @override
  State<OrderHistoryCard> createState() => _OrderHistoryCardState();
}

class _OrderHistoryCardState extends State<OrderHistoryCard> {
  double total = 15;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context).history;
    final totalAmt = Provider.of<Cart>(context);
    return SizedBox(
      height: 400,
      child: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, i) {
          return Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blueGrey[900],
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Ordered On ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        DateFormat('dd-MM-yyyy').format(
                          DateTime.now(),
                        ),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: cart[i].length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage(
                            cart[i].values.toList()[index].imageUrl,
                          ),
                          // child: ClipOval(
                          //   child: Image.asset(
                          //     cart[i].values.toList()[index].imageUrl,
                          //     fit: BoxFit.cover,
                          //   ),
                          // ),
                        ),
                        title: const Text('Cappucino'),
                        subtitle: Text(
                          cart[i].values.toList()[index].description,
                        ),
                        trailing: Text(
                            "x${cart[i].values.toList()[index].quantity.toString()}"),
                      );
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Order Total ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "\$ 22.98",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
