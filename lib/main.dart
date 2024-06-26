import 'package:app_commerce/app.dart';
import 'package:app_commerce/firebase_options.dart';
import 'package:app_commerce/src/data/database_repository.dart';
import 'package:app_commerce/src/data/mock_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  DatabaseRepository databaseRepository = MockDatabase();
  runApp(
    App(repo: databaseRepository),
  );
}
