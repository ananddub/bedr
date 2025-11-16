import '../drift/database.dart';

class RoomRepo {
  final AppDatabase _db;

  RoomRepo(this._db);

  Stream<Room?> watchRoom(int id) => _db.getRoom(id).watchSingleOrNull();

  Stream<List<Room>> watchRoomsByProperty(int propertyId) => 
      _db.getRoomsByProperty(propertyId).watch();

  Future<Room?> getRoom(int id) => _db.getRoom(id).getSingleOrNull();

  Future<List<Room>> getRoomsByProperty(int propertyId) => _db.getRoomsByProperty(propertyId).get();

  Future<void> insertRoom(int id, int propertyId, String name, String type, int isAcAvailable, String rentAmount, String securityDeposit) => 
      _db.insertRoom(id, propertyId, name, type, isAcAvailable, rentAmount, securityDeposit);

  Future<void> deleteRoom(int id) => _db.deleteRoom(id);

  Future<void> deleteRoomsByProperty(int propertyId) => _db.deleteRoomsByProperty(propertyId);
}
