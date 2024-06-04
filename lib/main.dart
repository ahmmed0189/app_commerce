import 'package:app_commerce/app.dart';
import 'package:app_commerce/src/data/database_repository.dart';
import 'package:app_commerce/src/data/mock_database.dart';
import 'package:flutter/material.dart';

void main() {
  DatabaseRepository databaseRepository = MockDatabase();
  runApp(
    App(repo: databaseRepository),
  );
}
