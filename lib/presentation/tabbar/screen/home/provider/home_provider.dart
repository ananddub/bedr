import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bedr/data/api/product.dart';
import 'package:bedr/data/api/models/property.dart' as api;
import 'package:bedr/data/api/models/property_response.dart';
import 'package:bedr/data/api/models/recommended_response.dart';
import 'package:bedr/data/db/repo/property_repo.dart';
import 'package:bedr/data/db/database_provider.dart';

class HomeState {
  final bool isLoading;
  final bool isLoadingMore;
  final PropertyResponse? properties;
  final List<RecommendedItem>? recommendedItems;
  final String? error;
  final int currentPage;
  final bool hasMore;
  final DateTime? lastFetch;

  HomeState({
    this.isLoading = false,
    this.isLoadingMore = false,
    this.properties,
    this.recommendedItems,
    this.error,
    this.currentPage = 1,
    this.hasMore = true,
    this.lastFetch,
  });

  HomeState copyWith({
    bool? isLoading,
    bool? isLoadingMore,
    PropertyResponse? properties,
    List<RecommendedItem>? recommendedItems,
    String? error,
    int? currentPage,
    bool? hasMore,
    DateTime? lastFetch,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      properties: properties ?? this.properties,
      recommendedItems: recommendedItems ?? this.recommendedItems,
      error: error ?? this.error,
      currentPage: currentPage ?? this.currentPage,
      hasMore: hasMore ?? this.hasMore,
      lastFetch: lastFetch ?? this.lastFetch,
    );
  }
}

class HomeNotifier extends ValueNotifier<HomeState> {
  HomeNotifier() : super(HomeState()) {
    _initRepo();
  }

  final PropertiesApi _propertiesApi = PropertiesApi();
  late final PropertyRepo _propertyRepo;
  bool _hasInitialized = false;

  void _initRepo() {
    _propertyRepo = PropertyRepo(DatabaseProvider.instance);
  }

  // Initialize only once to prevent repeated fetching
  Future<void> initializeIfNeeded() async {
    if (_hasInitialized) return;
    
    await _loadCachedFirst();
    _hasInitialized = true;
  }

  Future<void> _loadCachedFirst() async {
    try {
      await Future.delayed(Duration(milliseconds: 50));
      final cached = await _propertyRepo.getAllProperties();
      
      if (cached.isNotEmpty) {
        final properties = cached.map((p) => api.Property(
          id: p.id,
          propertyName: p.propertyName,
          displayName: p.displayName,
          propertyType: p.propertyType,
          accommodationType: p.accommodationType,
          locality: p.locality,
          city: p.city,
          rentAmount: p.rentAmount,
          distance: p.distance,
          rooms: [],
          propertyImages: [],
          ownerDetails: api.OwnerDetails(
            firstName: p.ownerFirstName,
            lastName: p.ownerLastName,
            mobileNumber: p.ownerMobileNumber,
          ),
        )).toList();

        final response = PropertyResponse.fromJson({
          'success': true,
          'data': {'docs': properties, 'totalDocs': properties.length},
        });

        value = value.copyWith(properties: response);
        print('Loaded ${properties.length} properties from cache');
      } else {
        // No cache, load from API
        _loadFromAPI();
      }
    } catch (e) {
      _loadFromAPI();
    }
  }

  Future<void> _loadFromAPI() async {
    value = value.copyWith(isLoading: true, error: null);

    try {
      final response = await _propertiesApi.getProperties(
        latitude: 19.0759559,
        longitude: 72.8776378,
        limit: 6,
        page: 1,
      );

      // Save to cache
      try {
        await _propertyRepo.bulkInsertProperties(response.data.docs);
        print('Saved ${response.data.docs.length} properties to cache');
      } catch (e) {
        print('Cache save failed: $e');
      }

      value = value.copyWith(
        isLoading: false,
        properties: response,
        hasMore: response.data.docs.length >= 6,
      );
    } catch (e) {
      value = value.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> loadProperties({bool forceRefresh = false}) async {
    if (forceRefresh) {
      await _loadFromAPI();
    } else {
      await _loadCachedFirst();
    }
  }

  Future<void> loadMoreProperties() async {
    if (value.isLoadingMore || !value.hasMore) return;

    value = value.copyWith(isLoadingMore: true);
    final nextPage = value.currentPage + 1;

    try {
      final response = await _propertiesApi.getProperties(
        latitude: 19.0759559,
        longitude: 72.8776378,
        limit: 6,
        page: nextPage,
      );

      final currentDocs = value.properties?.data.docs ?? [];
      final newDocs = [...currentDocs, ...response.data.docs];

      final updatedResponse = PropertyResponse.fromJson({
        'success': true,
        'data': {
          'docs': newDocs,
          'totalDocs': response.data.totalDocs,
        },
      });

      value = value.copyWith(
        isLoadingMore: false,
        properties: updatedResponse,
        currentPage: nextPage,
        hasMore: response.data.docs.length >= 6,
      );
    } catch (e) {
      value = value.copyWith(isLoadingMore: false);
    }
  }

  Future<void> loadRecommendedProperties() async {
    try {
      final response = await _propertiesApi.getRecommendedProperties({
        'latitude': 19.0759559,
        'longitude': 72.8776378,
        'limit': 6,
      });

      value = value.copyWith(recommendedItems: response.data);
    } catch (e) {
      try {
        final topResponse = await _propertiesApi.getTopProperties(limit: 6);
        final docs = (topResponse.data['docs'] as List);
        final items = docs.map((doc) => RecommendedItem(
          id: doc['id'].toString(),
          property: api.Property.fromJson(doc),
        )).toList();
        value = value.copyWith(recommendedItems: items);
      } catch (_) {
        // Keep showing cached data if both APIs fail
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}

// Global provider to prevent repeated fetching
final homeProvider = Provider<HomeNotifier>((ref) {
  final notifier = HomeNotifier();
  ref.onDispose(() => notifier.dispose());
  return notifier;
});
