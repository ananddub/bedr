import 'package:flutter/foundation.dart';
import 'package:bedr/data/api/product.dart';
import 'package:bedr/data/api/models/property.dart';

class SimilarPropertiesState {
  final List<Property> properties;
  final bool isLoading;

  SimilarPropertiesState({
    this.properties = const [],
    this.isLoading = false,
  });
}

class SimilarPropertiesNotifier extends ValueNotifier<SimilarPropertiesState> {
  final PropertiesApi _api = PropertiesApi();
  bool _disposed = false;

  SimilarPropertiesNotifier() : super(SimilarPropertiesState(isLoading: true)) {
    print('SimilarPropertiesNotifier initialized with isLoading: true');
  }

  Future<void> loadSimilarProperties(String locality) async {
    if (_disposed) return;
    
    print('Loading similar properties for: $locality');
    
    try {
      final response = await _api.getSimilarProperties(
        locality: locality,
        limit: 10,
      );
      
      print('Similar properties loaded: ${response.data.docs.length} items');
      
      if (!_disposed) {
        value = SimilarPropertiesState(
          properties: response.data.docs,
          isLoading: false,
        );
      }
    } catch (e) {
      print('Error loading similar properties: $e');
      if (!_disposed) {
        value = SimilarPropertiesState(
          properties: [],
          isLoading: false,
        );
      }
    }
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}
