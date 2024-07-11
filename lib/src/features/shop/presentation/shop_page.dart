import 'package:app_commerce/src/data/auth_repository.dart';
import 'package:app_commerce/src/data/database_repository.dart';

import 'package:app_commerce/src/features/shop/presentation/drawe_bar.dart';
import 'package:app_commerce/src/features/shop/presentation/men_produkt.dart';
import 'package:app_commerce/src/features/shop/presentation/women_product.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  // Attributes
  final List<String> tabs = ["All categories", "Men", "Women", "Kids"];

  // Constructor
  ShopPage({
    super.key,
  });

  // Methods
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          )
        ],
        title: Text(
          'ProvisionTec',
          style: TextStyle(color: Colors.amber),
        ),
        backgroundColor: Color.fromARGB(255, 4, 4, 4),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          ),
        ],
      ),
      drawer: DrawerBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Find the best Product for you
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
              child: Text(
                'Find the best Product for you',
                style: GoogleFonts.bebasNeue(
                  fontSize: 50,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 5),
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.amber,
                  ),
                  hintText: 'Find your product..',
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Tabs
            SizedBox(
              height: 50,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: tabs.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigate to the corresponding product pages
                      navigateToProductPage(context, tabs[index]);
                    },
                    child: Container(
                      height: 40,
                      margin: EdgeInsets.all(8),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color:
                            Color.fromARGB(179, 122, 169, 12).withOpacity(0.20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          tabs[index],
                          style: TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToProductPage(BuildContext context, String tabName) {
    final databaseRepository =
        Provider.of<DatabaseRepository>(context, listen: false);
    final authRepository = Provider.of<AuthRepository>(context, listen: false);

    switch (tabName) {
      case "Men":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MenProduct(),
          ),
        );
        break;
      case "Women":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WomenProduct(
              databaseRepository: databaseRepository,
              authRepository: authRepository,
            ),
          ),
        );
        break;
      // Add more cases as needed
      default:
        // Handle for the case when the tab is not recognized
        break;
    }
  }
}
