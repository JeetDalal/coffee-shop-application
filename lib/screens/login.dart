import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  bool _isTrue = false;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  void login(String email, String password) {
    try {
      FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.withOpacity(0.3),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: 1),
                  duration: const Duration(
                    seconds: 2,
                  ),
                  builder: (context, double value, child) {
                    return Opacity(
                      opacity: value,
                      child: Container(
                        // color: Colors.white,
                        height: 200,
                        width: 200,
                        child: Image.asset('images/logo.png'),
                      ),
                    );
                  },
                ),
                Text(
                  'We are glad to have you back',
                  style: TextStyle(
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.8),
                        blurRadius: 5,
                        offset: const Offset(-6, 6),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black.withOpacity(0.5),
                    ),
                    height: 50,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                              border: InputBorder.none, hintText: 'Email'),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black.withOpacity(0.5),
                  ),
                  height: 50,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: 'password'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    // final String email = _emailController.text;
                    // final String password = _passwordController.text;
                    // FirebaseAuth.instance.signInWithEmailAndPassword(
                    //     email: email, password: password);
                    Navigator.of(context).pushNamed('home-page');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white.withOpacity(0.5),
                    ),
                    height: 50,
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            // fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
