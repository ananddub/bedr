import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:bedr/data/api/product.dart';
import 'package:bedr/data/api/models/property.dart' as api;
import 'package:bedr/data/db/repo/property_repo.dart';
import 'package:bedr/data/db/database_provider.dart';

class SearchState {
  final List<api.Property> properties;
  final bool isLoading;
  final String? error;
  final String query;
  final String? selectedGender; // Changed to single selection
  final List<String> propertyTypes;
  final List<String> roomTypes;
  final RangeValues? budgetRange;

  SearchState({
    this.properties = const [],
    this.isLoading = false,
    this.error,
    this.query = '',
    this.selectedGender, // Single gender
    this.propertyTypes = const [],
    this.roomTypes = const [],
    this.budgetRange,
  });

  SearchState copyWith({
    List<api.Property>? properties,
    bool? isLoading,
    String? error,
    String? query,
    String? selectedGender, // Single gender
    List<String>? propertyTypes,
    List<String>? roomTypes,
    RangeValues? budgetRange,
  }) {
    return SearchState(
      properties: properties ?? this.properties,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      query: query ?? this.query,
      selectedGender: selectedGender ?? this.selectedGender,
      propertyTypes: propertyTypes ?? this.propertyTypes,
      roomTypes: roomTypes ?? this.roomTypes,
      budgetRange: budgetRange ?? this.budgetRange,
    );
  }
}

class SearchNotifier extends ValueNotifier<SearchState> {
  final PropertiesApi _api = PropertiesApi();
  final _searchSubject = BehaviorSubject<String>();
  bool _disposed = false;
  late final PropertyRepo _propertyRepo;
  bool _hasInitialized = false;

  SearchNotifier() : super(SearchState()) {
    _initRepo();
    _searchSubject
        .debounceTime(const Duration(milliseconds: 800))
        .distinct()
        .listen((query) {
          if (!_disposed) {
            if (query.trim().isEmpty) {
              _loadProperties();
            } else {
              _performSearch(query);
            }
          }
        });
  }

  void _initRepo() async {
    _propertyRepo = PropertyRepo(DatabaseProvider.instance);
  }

  // Restore previous search state when returning to screen
  Future<void> initializeIfNeeded() async {
    if (_hasInitialized) return;
    
    // If there are existing filters or query, reload with them
    if (value.query.isNotEmpty || 
        value.selectedGender != null || 
        value.propertyTypes.isNotEmpty || 
        value.roomTypes.isNotEmpty || 
        value.budgetRange != null) {
      await _loadProperties();
    } else {
      await loadInitialProperties();
    }
    
    _hasInitialized = true;
  }

  Future<void> _loadCachedDataFirst() async {
    try {
      await Future.delayed(Duration(milliseconds: 100));
      final cachedProperties = await _propertyRepo.getAllProperties();

      if (cachedProperties.isNotEmpty) {
        final apiProperties = cachedProperties
            .map(
              (p) => api.Property(
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
              ),
            )
            .toList();

        value = value.copyWith(properties: apiProperties);
      }
    } catch (e) {
      // Continue if cache fails
    }
  }

  void updateQuery(String query) {
    if (_disposed || value.query == query) return;
    value = value.copyWith(query: query);
    _searchSubject.add(query);
  }

  Future<void> loadInitialProperties() async {
    if (_disposed) return;

    // Show cached data first
    await _loadCachedDataFirst();

    // Load fresh data in background
    _loadFreshData();
  }

  Future<void> _loadFreshData() async {
    try {
      final response = await _api.getProperties(limit: 20);

      if (!_disposed) {
        // Update cache
        try {
          await _propertyRepo.bulkInsertProperties(response.data.docs);
        } catch (e) {
          // Continue if caching fails
        }

        value = value.copyWith(
          properties: response.data.docs,
          isLoading: false,
        );
      }
    } catch (e) {
      if (!_disposed) {
        value = value.copyWith(
          isLoading: false,
          error: 'Failed to load properties',
        );
      }
    }
  }

  Future<void> _loadProperties() async {
    if (_disposed || value.isLoading) return;

    value = value.copyWith(isLoading: true, error: null);

    try {
      final response = await _api.getProperties(
        limit: 20,
        search: value.query.trim().isEmpty ? null : value.query,
        genders: value.selectedGender != null ? [value.selectedGender!] : null,
        propertyTypes: value.propertyTypes.isEmpty ? null : value.propertyTypes,
        roomTypes: value.roomTypes.isEmpty ? null : value.roomTypes,
        minBudget: value.budgetRange?.start.toInt(),
        maxBudget: value.budgetRange?.end.toInt(),
      );

      if (!_disposed) {
        // Update cache
        try {
          await _propertyRepo.bulkInsertProperties(response.data.docs);
        } catch (e) {
          // Continue if caching fails
        }

        value = value.copyWith(
          properties: response.data.docs,
          isLoading: false,
        );
      }
    } catch (e) {
      if (!_disposed) {
        value = value.copyWith(
          isLoading: false,
          error: 'Server timeout. Try again.',
        );
      }
    }
  }

  Future<void> _performSearch(String query) async {
    await _loadProperties();
  }

  Future<void> applyFilters({
    String? selectedGender,
    List<String>? propertyTypes,
    List<String>? roomTypes,
    RangeValues? budgetRange,
  }) async {
    if (_disposed) return;
    value = value.copyWith(
      selectedGender: selectedGender,
      propertyTypes: propertyTypes,
      roomTypes: roomTypes,
      budgetRange: budgetRange,
    );

    await _loadProperties();
  }

  @override
  void dispose() {
    _disposed = true;
    _searchSubject.close();
    super.dispose();
  }
}

// Global provider to preserve state across tab switches
final searchProvider = Provider<SearchNotifier>((ref) {
  final notifier = SearchNotifier();
  ref.onDispose(() => notifier.dispose());
  return notifier;
});
