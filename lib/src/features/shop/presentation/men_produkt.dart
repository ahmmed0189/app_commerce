import 'package:app_commerce/src/data/auth_repository.dart';
import 'package:app_commerce/src/data/database_repository.dart';

import 'package:app_commerce/src/features/cart/presentation/produkt_tile.dart';
import 'package:app_commerce/src/features/overview/domain/product.dart';
import 'package:app_commerce/src/features/shop/presentation/produkt_typ.dart';
import 'package:flutter/material.dart';

class MenProduct extends StatefulWidget {
  final DatabaseRepository databaseRepository;

  MenProduct({
    required this.databaseRepository,
    super.key,
    required AuthRepository authRepository,
  });

  @override
  _MenProductState createState() => _MenProductState();
}

class _MenProductState extends State<MenProduct> {
  final List<List<dynamic>> productTyp = [
    ['All Categorie', false],
    ['Men', false],
    ['Trend', true],
  ];

  void productTypSelected(int index) {
    setState(() {
      for (int i = 0; i < productTyp.length; i++) {
        productTyp[i][1] = false;
      }
      productTyp[index][1] = true;
    });
  }

  late Future<List<Product>> products;
  @override
  void initState() {
    products = widget.databaseRepository.getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 30.0),
            child: Icon(Icons.search),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // hello Dear
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 5),
            child: Text(
              'Hello Dear',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 1),
            child: Text(
              'Lets shop somethings!',
              style: TextStyle(
                fontSize: 17,
                color: Colors.white54,
              ),
            ),
          ),
          const SizedBox(height: 25),
          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25.0,
            ),
            child: TextField(
              style: const TextStyle(color: Colors.white70),
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.amber,
                ),
                hintText: 'Find your produkt..',
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 202, 198, 198)),
                    borderRadius: BorderRadius.circular(15)),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
              ),
            ),
          ),

          const SizedBox(height: 40),
          //horizontall listview
          // ignore: sized_box_for_whitespace
          Container(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: productTyp.length,
              itemBuilder: (context, index) {
                return ProductTyp(
                  productTyp: productTyp[index][0],
                  isSelected: productTyp[index][1],
                  onTap: () {
                    productTypSelected(index);
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 40),
          FutureBuilder(
            future: products,
            builder: (context, snapshot) {
              /* 
                1. Uncompleted (Ladend)
                2. Completed with data (Fertig)
                3. Completed with error (Fehler)
                 */

              if (snapshot.hasData &&
                  snapshot.connectionState == ConnectionState.done) {
                // FALL: Future ist komplett und hat Daten!
                List<Product> products = snapshot.data!;
                return Expanded(
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: products
                          .map(
                            (e) => ProductTile(
                              product: e,
                              databaseRepository: widget.databaseRepository,
                            ),
                          )
                          .toList()),
                );
              } else if (snapshot.connectionState != ConnectionState.done) {
                // FALL: Sind noch im Ladezustand
                return const Center(child: CircularProgressIndicator());
              } else {
                // FALL: Es gab nen Fehler
                return const Icon(Icons.error);
              }
            },
          ),
        ],
      ),
    );
  }
}
