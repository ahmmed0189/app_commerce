import 'package:app_commerce/src/data/database_repository.dart';
import 'package:app_commerce/src/features/overview/domain/product.dart';
import 'package:app_commerce/src/features/profile/domain/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDatabase implements DatabaseRepository {
  final FirebaseFirestore _firebaseFirestore;

  FirestoreDatabase(this._firebaseFirestore);

  @override
  Future<List<Product>> getProducts() async {
    final snapshot = await _firebaseFirestore.collection('products').get();
    return snapshot.docs.map((doc) => Product.fromMap(doc.data())).toList();
  }

  @override
  Future<Product?> getProductById(int id) async {
    DocumentSnapshot doc = await _firebaseFirestore
        .collection('products')
        .doc(id.toString())
        .get();
    if (doc.exists) {
      return Product.fromMap(doc.data() as Map<String, dynamic>);
    }
    return null;
  }

  @override
  Future<void> addProduct(Product product) async {
    await _firebaseFirestore
        .collection('products')
        .doc(product.id.toString())
        .set(product.toMap());
  }

  @override
  Future<User?> getUserById(int id) async {
    DocumentSnapshot doc =
        await _firebaseFirestore.collection('users').doc(id.toString()).get();
    if (doc.exists) {
      return User.fromMap(doc.data() as Map<String, dynamic>);
    }
    return null;
  }

  @override
  Future<void> addUser(User user) async {
    await _firebaseFirestore
        .collection('users')
        .doc(user.id.toString())
        .set(user.toMap());
  }

  @override
  List<Product> get cart => _cart;
  final List<Product> _cart = [];

  @override
  void addToCart(Product item) {
    _cart.add(item);
  }

  @override
  void removeFromCart(Product item) {
    _cart.remove(item);
  }
}
