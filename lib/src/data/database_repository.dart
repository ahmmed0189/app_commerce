import 'package:app_commerce/src/features/overview/domain/product.dart';
import 'package:app_commerce/src/features/profile/domain/user.dart';

abstract class DatabaseRepository {
  // Produktbezogene Methoden
  Future<List<Product>> getProducts();
  Future<Product?> getProductById(int id);
  Future<void> addProduct(Product product);

  // Benutzerbezogene Methoden

  Future<User?> getUserById(int id);
  Future<void> addUser(User user);
  List<Product> get cart;

  void addToCart(Product item);

  // remove item from cart
  void removeFromCart(Product item);
}
