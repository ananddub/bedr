import '../drift/database.dart';

class UserRepo {
  final AppDatabase _db;

  UserRepo(this._db);

  Stream<User?> watchUser(int id) => _db.getUser(id).watchSingleOrNull();

  Stream<List<User>> watchAllUsers() => _db.getAllUsers().watch();

  Future<User?> getUser(int id) => _db.getUser(id).getSingleOrNull();

  Future<List<User>> getAllUsers() => _db.getAllUsers().get();

  Future<void> insertUser(int id, String firstName, String lastName, String email, String mobileNumber) => 
      _db.insertUser(id, firstName, lastName, email, mobileNumber);

  Future<void> updateUser(int id, String firstName, String lastName, String email, String mobileNumber) => 
      _db.updateUser(firstName, lastName, email, mobileNumber, id);

  Future<void> deleteUser(int id) => _db.deleteUser(id);
}
