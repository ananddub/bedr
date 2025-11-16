import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:bedr/data/db/drift/database.dart';
import 'package:bedr/data/db/repo/favourites_repo.dart';
import 'package:bedr/data/db/repo/property_repo.dart';
import 'package:bedr/data/api/models/property.dart' as api;

class FavouritesScreenState {
  final List<api.Property> properties;
  final bool isLoading;
  final String? error;

  FavouritesScreenState({
    this.properties = const [],
    this.isLoading = false,
    this.error,
  });

  FavouritesScreenState copyWith({
    List<api.Property>? properties,
    bool? isLoading,
    String? error,
  }) {
    return FavouritesScreenState(
      properties: properties ?? this.properties,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class FavouritesScreenNotifier extends ValueNotifier<FavouritesScreenState> {
  final FavouritesRepo _favouritesRepo;
  final PropertyRepo _propertyRepo;
  StreamSubscription? _subscription;

  FavouritesScreenNotifier(AppDatabase db)
      : _favouritesRepo = FavouritesRepo(db),
        _propertyRepo = PropertyRepo(db),
        super(FavouritesScreenState(isLoading: true)) {
    _subscription = _favouritesRepo.watchAllFavourites().listen(
      (favourites) => _loadPropertiesFromFavourites(favourites),
      onError: (error) {
        value = value.copyWith(isLoading: false, error: error.toString());
      },
    );
  }

  Future<void> _loadPropertiesFromFavourites(List<Favourite> favourites) async {
    try {
      final properties = <api.Property>[];

      for (var fav in favourites) {
        final dbProperty = await _propertyRepo.getProperty(fav.propertyId);
        if (dbProperty != null) {
          final rooms = await _propertyRepo.getRoomsByProperty(fav.propertyId);
          final images = await _propertyRepo.getImagesByProperty(fav.propertyId);

          properties.add(api.Property(
            id: dbProperty.id,
            propertyName: dbProperty.propertyName,
            displayName: dbProperty.displayName,
            propertyType: dbProperty.propertyType,
            accommodationType: dbProperty.accommodationType,
            locality: dbProperty.locality,
            city: dbProperty.city,
            rentAmount: dbProperty.rentAmount,
            distance: dbProperty.distance,
            rooms: rooms.map((r) => api.Room(
              id: r.id,
              name: r.name,
              type: r.type,
              isAcAvailable: r.isAcAvailable == 1,
              rentAmount: r.rentAmount,
              securityDeposit: r.securityDeposit,
            )).toList(),
            propertyImages: images.map((img) => api.PropertyImage(
              id: img.id,
              order: img.orderIndex,
              propImgM2: api.PropImgM2(
                fileName: img.fileName,
                prefix: img.prefix,
              ),
            )).toList(),
            ownerDetails: api.OwnerDetails(
              firstName: dbProperty.ownerFirstName,
              lastName: dbProperty.ownerLastName,
              mobileNumber: dbProperty.ownerMobileNumber,
            ),
          ));
        }
      }

      value = value.copyWith(properties: properties, isLoading: false);
    } catch (e) {
      value = value.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> loadFavourites() async {
    value = value.copyWith(isLoading: true, error: null);
    // Stream will automatically trigger reload
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
