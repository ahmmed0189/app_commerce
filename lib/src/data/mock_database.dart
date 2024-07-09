/*import 'package:app_commerce/src/data/database_repository.dart';
import 'package:app_commerce/src/features/overview/domain/product.dart';
import 'package:app_commerce/src/features/profile/domain/user.dart';

class MockDatabase implements DatabaseRepository {
  final List<Product> _products = [
    Product(
      id: "1",
      name: "CHILLWAVE GOLD TORTOISE GREEN",
      description: "dummytext",
      price: 132.99,
      imageUrl: "assets/brillem/bild2.png",
    ),
    Product(
      id: "2",
      name: "CHRONOGRAPH BLUE ORANGEN",
      description: "dummytext",
      price: 213.99,
      imageUrl: "assets/uhrenm/bild2.png",
    ),
    Product(
      id: "3",
      name: "NATURALIST MARMOR & SILBER",
      description: "dummytext",
      price: 289.99,
      imageUrl: "assets/uhrenm/bilds1.png",
    ),

    // Add more sample products
  ];
// jemand regestriert
  final List<User> _users = [
    User(
        username: "smith123",
        email: "test@gmail.com",
        password: "1234A",
        id: 1,
        name: "hon smith")

    // Add more sample users
  ];
  final List<Product> _cart = [];

  // Helper function to simulate a random network delay between 1 and 3 seconds
  _simulateNetworkDelay() {
    return Future.delayed(const Duration(seconds: 2));
  }

  // Product-related methods
  @override
  Future<List<Product>> getProducts() async {
    await _simulateNetworkDelay();
    return _products;
  }

  @override
  Future<Product?> getProductById(int id) async {
    await _simulateNetworkDelay();
    for (var product in _products) {
      if (product.id == id) {
        return product;
      }
    }

    return null;
  }

  @override
  Future<void> addProduct(Product product) async {
    await _simulateNetworkDelay();
    _products.add(product);
  }

  @override
  Future<User?> getUserById(int id) async {
    await _simulateNetworkDelay();
    for (var user in _users) {
      if (user.id == id) {
        return user;
      }
    }
    return null;
  }

  @override
  Future<void> addUser(User user) async {
    await _simulateNetworkDelay();
    _users.add(user);
  }

  @override
  List<Product> get cart => _cart;
  @override
  void addToCart(Product item) {
    _cart.add(item);
  }

  @override
  // remove item from cart
  void removeFromCart(Product item) {
    _cart.remove(item);
  }
}
*/