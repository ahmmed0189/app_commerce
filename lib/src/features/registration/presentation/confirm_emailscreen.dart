import 'package:app_commerce/src/data/auth_repository.dart';
import 'package:app_commerce/src/data/database_repository.dart';
import 'package:app_commerce/src/features/registration/presentation/succ_emailscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmEmailScreen extends StatelessWidget {
  // Attribute
  final DatabaseRepository databaseRepository;
  final AuthRepository authRepository;
  // Konstruktor
  ConfirmEmailScreen(
      {required this.databaseRepository,
      super.key,
      required this.authRepository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 11, 11, 11),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              // logo
              children: [
                const SizedBox(height: 50),
                // logo
                const Image(
                  image: AssetImage('assets/images/logo.png'),
                ),
                const SizedBox(height: 50),

                //provisionTec
                Text(
                  'ProvisionTec Shop',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 42,
                    color: const Color.fromARGB(208, 210, 176, 76),
                  ),
                ),
                const SizedBox(height: 70),

                // text hello
                Text(
                  'Verify your email address!',
                  style:
                      GoogleFonts.bebasNeue(fontSize: 35, color: Colors.white),
                ),
                const SizedBox(height: 10),
                // EmailText
                const Text(
                  'test@gmail.com',
                  style: TextStyle(fontSize: 15, color: Colors.red),
                ),
                const SizedBox(height: 10),

                //text gratulation
                const Center(
                  child: Text(
                    'Gratulations! Your Account Awaits: Verify Your Email to Start Shopping and Experience a World of Unrivaled Deals and Personalized Offers.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white54,
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // butten confirm
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SuccEmailScreen(
                                  databaseRepository: databaseRepository,
                                  authRepository: authRepository,
                                )),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(173, 209, 184, 55),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          'Continue',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 90),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
