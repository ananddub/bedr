import '../drift/database.dart';
import '../../api/models/property.dart' as api;

class PropertyRepo {
  final AppDatabase _db;

  PropertyRepo(this._db);

  Stream<Property?> watchProperty(int id) => _db.getProperty(id).watchSingleOrNull();

  Stream<List<Property>> watchAllProperties() => _db.getAllProperties().watch();

  Stream<List<Property>> watchPropertiesByCity(String city) => 
      _db.getPropertiesByCity(city).watch();

  Stream<List<Property>> watchPropertiesByLocality(String locality) => 
      _db.getPropertiesByLocality(locality).watch();

  Stream<List<Room>> watchRoomsByProperty(int propertyId) => 
      _db.getRoomsByProperty(propertyId).watch();

  Stream<List<PropertyImage>> watchImagesByProperty(int propertyId) => 
      _db.getImagesByProperty(propertyId).watch();

  Future<Property?> getProperty(int id) => _db.getProperty(id).getSingleOrNull();

  Future<List<Property>> getAllProperties() => _db.getAllProperties().get();

  Future<List<Property>> getPropertiesByCity(String city) => _db.getPropertiesByCity(city).get();

  Future<List<Property>> getPropertiesByLocality(String locality) => 
      _db.getPropertiesByLocality(locality).get();

  Future<List<Room>> getRoomsByProperty(int propertyId) => 
      _db.getRoomsByProperty(propertyId).get();

  Future<List<PropertyImage>> getImagesByProperty(int propertyId) => 
      _db.getImagesByProperty(propertyId).get();

  Future<void> insertProperty(api.Property property) async {
    try {
      await _db.insertProperty(
        property.id,
        property.propertyName,
        property.displayName,
        property.propertyType,
        property.accommodationType,
        property.locality,
        property.city,
        property.rentAmount,
        property.distance,
        property.ownerDetails.firstName,
        property.ownerDetails.lastName,
        property.ownerDetails.mobileNumber,
      );
    } catch (e) {
      if (e.toString().contains('UNIQUE constraint failed')) {
        // Delete and insert again for updates
        await _db.deleteProperty(property.id);
        await _db.insertProperty(
          property.id,
          property.propertyName,
          property.displayName,
          property.propertyType,
          property.accommodationType,
          property.locality,
          property.city,
          property.rentAmount,
          property.distance,
          property.ownerDetails.firstName,
          property.ownerDetails.lastName,
          property.ownerDetails.mobileNumber,
        );
      }
    }

    // Save images for favorites to work properly
    for (var image in property.propertyImages) {
      try {
        await _db.insertImage(
          image.id,
          property.id,
          image.order,
          image.propImgM2.fileName,
          image.propImgM2.prefix,
        );
      } catch (e) {
        // Ignore duplicate image errors
      }
    }
  }

  Future<void> bulkInsertProperties(List<api.Property> properties) async {
    for (var property in properties) {
      await insertProperty(property);
    }
  }

  Future<void> deleteProperty(int id) => _db.deleteProperty(id);
}
