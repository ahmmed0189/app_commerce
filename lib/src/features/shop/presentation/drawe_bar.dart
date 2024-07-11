import 'package:app_commerce/src/features/registration/presentation/login_screen.dart';

import 'package:flutter/material.dart';

class DrawerBar extends StatelessWidget {
  // Attribute

  // Konstruktor
  DrawerBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFF17203A),
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 135, 156, 215),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Image(
                  image: AssetImage('assets/images/profil.png'),
                ),
                SizedBox(height: 10),
                Text('Smith'),
                Text('testsmith@gmail.com')
              ],
            ),
          ),
          SizedBox(height: 20),
          ListTile(
            leading: Icon(Icons.home),
            iconColor: Colors.amber,
            title: const Text(
              'My Profil',
              style: TextStyle(fontSize: 17),
            ),
            textColor: Colors.amber,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.shopping_cart_sharp),
            iconColor: Colors.amber,
            title: const Text(
              'Cart',
              style: TextStyle(fontSize: 17),
            ),
            textColor: Colors.amber,
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/cart_page');
            },
          ),
          SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.payment),
            iconColor: Colors.amber,
            title: const Text(
              'Payment Methoden',
              style: TextStyle(fontSize: 17),
            ),
            textColor: Colors.amber,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.contact_emergency),
            iconColor: Colors.amber,
            title: const Text(
              'Contact Us',
              style: TextStyle(fontSize: 17),
            ),
            textColor: Colors.amber,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.settings),
            iconColor: Colors.amber,
            title: const Text(
              'Settings',
              style: TextStyle(fontSize: 17),
            ),
            textColor: Colors.amber,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            iconColor: Colors.amber,
            title: const Text(
              'Exit',
              style: TextStyle(fontSize: 17),
            ),
            textColor: Colors.amber,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
