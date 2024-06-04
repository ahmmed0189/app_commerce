import 'package:app_commerce/src/data/database_repository.dart';
import 'package:app_commerce/src/features/cart/presentation/cart_page.dart';
import 'package:app_commerce/src/features/registration/presentation/login_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  final DatabaseRepository repo;
  App({required this.repo, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      home: LoginScreen(repo: repo),
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.amber,
      ),
      routes: {
        '/cart_page': (context) => CartPage(repo: repo),
      },
    );
  }
}
