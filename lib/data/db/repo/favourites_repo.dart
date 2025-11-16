import '../drift/database.dart';

class FavouritesRepo {
  final AppDatabase _db;

  FavouritesRepo(this._db);

  Stream<List<Favourite>> watchAllFavourites() => _db.getAllFavourites().watch();

  Stream<Favourite?> watchFavourite(int propertyId) => 
      _db.getFavourite(propertyId).watchSingleOrNull();

  Stream<bool> watchIsFavourite(int propertyId) async* {
    await for (final result in _db.isFavourite(propertyId).watchSingle()) {
      yield result;
    }
  }

  Future<List<Favourite>> getAllFavourites() => _db.getAllFavourites().get();

  Future<Favourite?> getFavourite(int propertyId) => _db.getFavourite(propertyId).getSingleOrNull();

  Future<bool> isFavourite(int propertyId) async {
    final result = await _db.isFavourite(propertyId).getSingle();
    return result;
  }

  Future<void> addToFavourites(int propertyId) => 
      _db.insertFavourite(propertyId, DateTime.now().millisecondsSinceEpoch);

  Future<void> removeFromFavourites(int propertyId) => _db.deleteFavourite(propertyId);

  Future<void> clearFavourites() => _db.clearFavourites();
}
