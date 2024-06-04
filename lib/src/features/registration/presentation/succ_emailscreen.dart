import 'package:app_commerce/src/data/database_repository.dart';
import 'package:app_commerce/src/features/registration/presentation/welcome.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccEmailScreen extends StatelessWidget {
  // Attribute
  final DatabaseRepository repo;
  // Konstruktor
  SuccEmailScreen({required this.repo, super.key});

  // Methoden
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
                  'Your account successfully created!',
                  textAlign: TextAlign.center,
                  style:
                      GoogleFonts.bebasNeue(fontSize: 35, color: Colors.white),
                ),
                const SizedBox(height: 10),

                //text welcome
                const Center(
                  child: Text(
                    'Welcome to Your Ultimate Shopping Destination: Your Account is Created. Unleash the Jay of Seamless Online Shopping.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white54,
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // butten confirm
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WelcomeToTec(
                                  repo: repo,
                                )),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(173, 209, 184, 55),
                        borderRadius: BorderRadius.circular(50),
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
