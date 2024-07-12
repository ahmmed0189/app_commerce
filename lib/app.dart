import 'package:app_commerce/src/data/auth_repository.dart';
import 'package:app_commerce/src/features/registration/presentation/login_screen.dart';
import 'package:app_commerce/src/features/shop/presentation/shop_page.dart';
import 'package:app_commerce/src/features/cart/presentation/cart_page.dart'; // Ensure the path is correct
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_commerce/src/data/database_repository.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    const loginKey = ValueKey('loginScreen');
    const shopKey = ValueKey('shopScreen');

    return StreamBuilder(
      stream: context.read<AuthRepository>().authStateChanges(),
      builder: (context, snapshot) {
        final user = snapshot.data;
        return MaterialApp(
          key: user == null ? loginKey : shopKey,
          theme: ThemeData(
              brightness: Brightness.dark, primarySwatch: Colors.amber),
          home: user == null ? LoginScreen() : ShopPage(),
          routes: {
            '/cart_page': (context) => CartPage(
                  databaseRepository:
                      Provider.of<DatabaseRepository>(context, listen: false),
                ),
          },
        );
      },
    );
  }
}
