import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/cart.dart';
import 'cart_tile.dart';

class CartList extends StatelessWidget {
  const CartList({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final cartItem = Provider.of<Cart>(context);
    final cart = cartItem.cartList;
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade900,
        ),
        height: 400,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                child: Text(
                  'Your Order',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
              SizedBox(
                height: 300,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: cart.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return CartItemTile(
                      prodId: cart.keys.toList()[index],
                      description: cart.values.toList()[index].description,
                      imageUrl: cart.values.toList()[index].imageUrl,
                      price: cart.values.toList()[index].price,
                      quantity: cart.values.toList()[index].quantity,
                      title: cart.values.toList()[index].title,
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
