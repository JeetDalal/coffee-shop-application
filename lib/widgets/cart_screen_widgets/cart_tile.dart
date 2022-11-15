import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/cart.dart';

class CartItemTile extends StatelessWidget {
  final String prodId;
  final String imageUrl;
  final String title;
  final String description;
  final double price;
  final int quantity;
  const CartItemTile({
    Key? key,
    required this.prodId,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: ValueKey(prodId),
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (direction) {
        cart.removeItem(prodId);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          leading: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 30,
            child: ClipOval(
              child: Image.asset(
                imageUrl,
              ),
            ),
          ),
          subtitle: Text(
            description,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          trailing: Text(
            'x${quantity}\n\$ ${quantity * price}',
            textAlign: TextAlign.right,
          ),
        ),
      ),
    );
  }
}
