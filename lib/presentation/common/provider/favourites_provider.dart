import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:bedr/data/db/drift/database.dart';
import 'package:bedr/data/db/repo/favourites_repo.dart';
import 'package:bedr/data/db/repo/property_repo.dart';
import 'package:bedr/data/api/models/property.dart' as api;

class FavouritesNotifier extends ValueNotifier<Set<int>> {
  final FavouritesRepo _favouritesRepo;
  final PropertyRepo _propertyRepo;
  StreamSubscription? _subscription;

  FavouritesNotifier(AppDatabase db)
      : _favouritesRepo = FavouritesRepo(db),
        _propertyRepo = PropertyRepo(db),
        super({}) {
    _subscription = _favouritesRepo.watchAllFavourites().listen((favourites) {
      value = favourites.map((f) => f.propertyId).toSet();
    });
  }

  bool isFavourite(int propertyId) => value.contains(propertyId);

  Future<void> toggleFavourite(api.Property property) async {
    if (value.contains(property.id)) {
      await _favouritesRepo.removeFromFavourites(property.id);
    } else {
      await _propertyRepo.insertProperty(property);
      await _favouritesRepo.addToFavourites(property.id);
    }
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
