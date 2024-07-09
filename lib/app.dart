import 'package:app_commerce/src/data/auth_repository.dart';
import 'package:app_commerce/src/data/database_repository.dart';

import 'package:app_commerce/src/features/registration/presentation/login_screen.dart';
import 'package:app_commerce/src/features/shop/presentation/shop_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  final DatabaseRepository databaseRepository;
  final AuthRepository authRepository;

  const App({
    required this.databaseRepository,
    required this.authRepository,
  });

  @override
  Widget build(BuildContext context) {
    const loginKey = ValueKey('loginScreen');
    const shopKey = ValueKey('shopScreen');

    return StreamBuilder(
      stream: authRepository.authStateChanges(),
      builder: (context, snapshot) {
        final user = snapshot.data;
        return MaterialApp(
          key: user == null ? loginKey : shopKey,
          theme: ThemeData(
              brightness: Brightness.dark, primarySwatch: Colors.amber),
          home: user == null
              ? LoginScreen(
                  databaseRepository: databaseRepository,
                  authRepository: authRepository,
                )
              : ShopPage(
                  databaseRepository: databaseRepository,
                  authRepository: authRepository,
                ),
        );
      },
    );
  }
}
