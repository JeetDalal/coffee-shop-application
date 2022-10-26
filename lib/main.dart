import 'package:coffeeapp/provider/cart.dart';
import 'package:coffeeapp/provider/coffee.dart';
import 'package:coffeeapp/provider/coffee_provider.dart';
import 'package:coffeeapp/screens/cart_screen.dart';
import 'package:coffeeapp/screens/coffee_screen.dart';
import 'package:coffeeapp/screens/mediator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/home_page.dart';
import 'screens/login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CoffeeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        initialRoute: '/page-controller',
        routes: {
          '/checkout-screen': (context) => CartScreen(),
          '/cart-screen': (context) => const LoginPage(),
          '/home-page': (context) => const HomePage(),
          '/coffee-screen': (context) => const CoffeeScreen(),
          '/page-controller': (context) => const Mediate(),
        },
      ),
    );
  }
}
