import 'package:app_commerce/src/data/auth_repository.dart';
import 'package:app_commerce/src/data/database_repository.dart';
import 'package:app_commerce/src/features/cart/presentation/cart_page.dart';
import 'package:app_commerce/src/features/registration/presentation/login_screen.dart';
import 'package:app_commerce/src/features/shop/presentation/shop_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  final DatabaseRepository repo;
  final AuthRepository authRepository;

  const App({required this.repo, required this.authRepository, super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: authRepository.authStateChanges(),
        builder: (context, snapshot) {
          final user = snapshot.data;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            darkTheme: ThemeData.dark(),
            theme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.amber,
            ),
            home: user == null
                ? LoginScreen(
                    repo: repo,
                    authRepository: authRepository,
                  )
                : ShopPage(
                    repo: repo,
                    authRepository: authRepository,
                  ),
            routes: {
              '/cart_page': (context) => CartPage(repo: repo),
            },
          );
        });
  }
}
