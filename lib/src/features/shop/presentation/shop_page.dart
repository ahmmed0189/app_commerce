import 'package:app_commerce/src/data/auth_repository.dart';
import 'package:app_commerce/src/data/database_repository.dart';
import 'package:app_commerce/src/features/shop/presentation/women_product.dart';
import 'package:app_commerce/src/features/shop/presentation/drawe_bar.dart';
import 'package:app_commerce/src/features/shop/presentation/men_produkt.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopPage extends StatelessWidget {
  // Attribute
  final List<String> tabs = ["All categories", "Men", "Women", "Kind"];
  final DatabaseRepository repo;
  final AuthRepository authRepository;
  // Konstruktor
  ShopPage({
    required this.repo,
    super.key,
    required this.authRepository,
  });

  // Methoden
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
        drawer: DrawerBar(
          repo: repo,
          authRepository: authRepository,
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            // Find the best Produkt for you
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
              padding: const EdgeInsets.symmetric(
                horizontal: 22.0,
              ),
              child: TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.amber,
                  ),
                  hintText: 'Find your produkt..',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600),
                      borderRadius: BorderRadius.circular(15)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 50,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: tabs.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          // Hier Navigation zu den entsprechenden Produktseiten durchführen
                          navigateToProductPage(context, tabs[index], repo);
                        },
                        child: FittedBox(
                          child: Container(
                            height: 40,
                            margin: EdgeInsets.all(8),
                            padding: EdgeInsets.only(
                              left: 20,
                              right: 20,
                            ),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(179, 122, 169, 12)
                                  .withOpacity(0.20),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: FittedBox(
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
                          ),
                        ));
                  }),
            ),

            /*FanCarouselImageSlider(
              imagesLink: allProducts.map((e) => e.imageUrl).toList(),
              isAssets: false,
            ),*/
          ]),
        ));
  }
}

void navigateToProductPage(
    BuildContext context, String tabName, DatabaseRepository repo) {
  switch (tabName) {
    case "Men":
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MenProduct(
                  repo: repo,
                )),
      );
      break;
    case "Women":
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WomenProduct()),
      );
      break;

    // Füge weitere Fälle hinzu, wenn benötigt
    default:
      // Handle für den Fall, dass der Tab nicht erkannt wird
      break;
  }
}
