import '../drift/database.dart';

class CartRepo {
  final AppDatabase _db;

  CartRepo(this._db);

  Stream<List<CartData>> watchAllCartItems() => _db.getAllCartItems().watch();

  Stream<CartData?> watchCartItem(int propertyId, int roomId) => 
      _db.getCartItem(propertyId, roomId).watchSingleOrNull();

  Future<List<CartData>> getAllCartItems() => _db.getAllCartItems().get();

  Future<CartData?> getCartItem(int propertyId, int roomId) => 
      _db.getCartItem(propertyId, roomId).getSingleOrNull();

  Future<void> addToCart(int propertyId, int roomId) => 
      _db.insertCartItem(propertyId, roomId, DateTime.now().millisecondsSinceEpoch);

  Future<void> removeFromCart(int id) => _db.deleteCartItem(id);

  Future<void> clearCart() => _db.clearCart();
}
