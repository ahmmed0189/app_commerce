import 'package:app_commerce/src/data/auth_repository.dart';
import 'package:app_commerce/src/data/database_repository.dart';
import 'package:app_commerce/src/features/registration/presentation/login_screen.dart';
import 'package:app_commerce/src/features/shop/presentation/shop_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  final DatabaseRepository databaseRepository;
  final AuthRepository authRepository;

  const App({
    super.key,
    required this.databaseRepository,
    required this.authRepository,
    required DatabaseRepository repo,
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
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.light,
          home: user == null
              ? LoginScreen(
                  repo: databaseRepository,
                  authRepository: authRepository,
                )
              : ShopPage(
                  repo: databaseRepository,
                  authRepository: authRepository,
                ),
        );
      },
    );
  }
}
