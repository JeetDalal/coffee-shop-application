import 'package:coffeeapp/provider/cart.dart';
import 'package:coffeeapp/provider/coffee.dart';
import 'package:coffeeapp/provider/coffee_provider.dart';
import 'package:coffeeapp/screens/cart_screen.dart';
import 'package:coffeeapp/screens/coffee_screen.dart';
import 'package:coffeeapp/screens/mediator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'screens/history_screen.dart';
import 'screens/home_page.dart';
import 'screens/login.dart';
import 'screens/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
          '/register-screen': (context) => const RegisterScreen(),
          '/cart-screen': (context) => const LoginPage(),
          '/home-page': (context) => const HomePage(),
          '/coffee-screen': (context) => const CoffeeScreen(),
          '/page-controller': (context) => const Mediate(),
          '/profile-screen': (context) => const HistoryScreen(),
        },
      ),
    );
  }
}
