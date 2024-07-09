import 'package:app_commerce/app.dart';
import 'package:app_commerce/firebase_options.dart';
import 'package:app_commerce/src/data/auth_repository.dart';
import 'package:app_commerce/src/data/database_repository.dart';
import 'package:app_commerce/src/data/firestore_database.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  DatabaseRepository databaseRepository =
      FirestoreDatabase(FirebaseFirestore.instance);

  AuthRepository authRepository = AuthRepository(FirebaseAuth.instance);

  runApp(
    App(
      databaseRepository: databaseRepository,
      authRepository: authRepository,
    ),
  );
}
