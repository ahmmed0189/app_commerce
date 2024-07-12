import 'package:app_commerce/src/common/my_button.dart';

import 'package:app_commerce/src/features/shop/presentation/shop_page.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeToTec extends StatelessWidget {
  // Attribute

  // Konstruktor
  WelcomeToTec({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 11, 11, 11),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // logo
              children: [
                Container(
                  width: 200,
                  height: 200,
                  child: Center(
                    child: Image(
                      image: AssetImage('assets/images/logo.png'),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Welcome to',
                  style:
                      GoogleFonts.bebasNeue(fontSize: 42, color: Colors.white),
                ),
                SizedBox(height: 5),
                Text(
                  'ProvisionTec Shop',
                  style: GoogleFonts.bebasNeue(
                      fontSize: 42, color: Color.fromARGB(212, 222, 167, 28)),
                ),
                SizedBox(height: 10),
                MyButton(
                  ontap: () {},
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ShopPage()),
                      );
                    },
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
