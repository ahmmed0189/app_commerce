import 'package:app_commerce/src/features/cart/presentation/produkt_tile.dart';
import 'package:app_commerce/src/features/overview/domain/product.dart';
import 'package:app_commerce/src/features/shop/presentation/produkt_typ.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_commerce/src/data/database_repository.dart';

class MenProduct extends StatefulWidget {
  MenProduct({super.key});

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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final databaseRepository = Provider.of<DatabaseRepository>(context);

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
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              style: const TextStyle(color: Colors.white70),
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.amber,
                ),
                hintText: 'Find your product..',
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
          // Horizontal listview
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
          FutureBuilder<List<Product>>(
            future: databaseRepository.getProducts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Icon(Icons.error);
              } else if (snapshot.hasData) {
                List<Product> products = snapshot.data!;
                return Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: products
                        .map(
                          (product) => ProductTile(
                            product: product,
                          ),
                        )
                        .toList(),
                  ),
                );
              } else {
                return const Center(child: Text('No products available'));
              }
            },
          ),
        ],
      ),
    );
  }
}
