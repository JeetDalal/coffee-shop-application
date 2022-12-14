import 'package:coffeeapp/provider/coffee.dart';
import 'package:coffeeapp/provider/coffee_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:slide_to_act/slide_to_act.dart';
import '../provider/cart.dart';
import '../widgets/cart_screen_widgets/cart_list.dart';
import '../widgets/frequent_product.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<String> tips = ['\$ 10', '\$ 20', '\$ 30', '\$ 40'];

  @override
  Widget build(BuildContext context) {
    final products =
        Provider.of<CoffeeProvider>(context, listen: false).coffeeItem;
    final cartItem = Provider.of<Cart>(context);
    final cart = cartItem.cartList;

    return Scaffold(
      // bottomNavigationBar: BNavigtionBar(),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: cart.isNotEmpty
            ? SingleChildScrollView(
                child: SizedBox(
                  child: Column(
                    children: [
                      SizedBox(
                        child: Column(
                          children: const [
                            Text(
                              'Your Cart',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                              ),
                            ),
                            CartList(),
                          ],
                        ),
                        // color: Colors.orange.withOpacity(0.9),
                      ),
                      SizedBox(
                        child: Column(
                          children: [
                            Container(
                              height: 230,
                              color: Colors.blueGrey.shade900,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 20, left: 15),
                                    child: Text(
                                      'Frequently Bought Together',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 180,
                                    width: MediaQuery.of(context).size.width,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: products.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 20,
                                          ),
                                          child: FrequentProducts(
                                            imageUrl: products[index].imageUrl,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        // color: Colors.green.withOpacity(0.9),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          color: Colors.blueGrey.shade900,
                          height: 110,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 20,
                                  left: 15,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Delivery Partner Tip',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      'The entire amount will be sent to your delivery',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: tips.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      child: Container(
                                        height: 30,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Center(
                                          child: Text(
                                            tips[index].toString(),
                                            style: const TextStyle(
                                                color: Colors.grey),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 90,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.blueGrey.shade900,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 15),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text(
                                        'Item Total : ',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        '\$ 5',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text(
                                        'Delivery Fee : ',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        '\$ 5',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text(
                                        'Packaging Fee : ',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        '\$ 5',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Container(
                          height: 50,
                          color: Colors.blueGrey.shade900,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'To Pay ',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 25,
                                  ),
                                ),
                                Text(
                                  '\$ ${(cartItem.toPay.toStringAsFixed(2))}',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 25,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SlideAction(
                        text: "Swipe To Pay",
                        innerColor: Colors.black,
                        borderRadius: 20,
                        outerColor: Colors.blueGrey[900],
                        onSubmit: () {
                          cartItem.addToHistory();
                          cartItem.clearCart();
                          for (int i = 0; i < products.length; i++) {
                            products[i].quantity = 0;
                          }
                        },
                      ),
                    ],
                  ),
                ),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 300,
                      width: 300,
                      child: SvgPicture.asset(
                        'images/empty_cart.svg',
                      ),
                    ),
                    const Text(
                      'Add Items To Cart',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
