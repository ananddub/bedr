import 'package:bedr/data/api/api.dart';
import 'package:bedr/data/api/models/property_response.dart';
import 'package:bedr/data/api/models/api_response.dart';
import 'package:bedr/data/api/models/recommended_response.dart';
import 'package:bedr/util/location_service.dart';

class PropertiesApi {
  final ApiClient _apiClient = ApiClient();

  Future<PropertyResponse> getProperties({
    double? latitude,
    double? longitude,
    int radius = 50,
    int page = 1,
    int limit = 10,
    String? search,
    List<String>? genders,
    List<String>? propertyTypes,
    List<String>? roomTypes,
    int? minBudget,
    int? maxBudget,
  }) async {
    // Use default Mumbai location
    latitude = latitude ?? 19.0759559;
    longitude = longitude ?? 72.8776378;

    Map<String, dynamic> queryParams = {
      'latitude': latitude,
      'longitude': longitude,
      'radius': radius,
      'page': page,
      'limit': limit,
    };

    if (search != null && search.isNotEmpty) queryParams['search'] = search;
    if (genders != null && genders.isNotEmpty) {
      queryParams['gender'] = genders.map((e) => e.toLowerCase()).join(',');
    }
    if (propertyTypes != null && propertyTypes.isNotEmpty) {
      queryParams['propertyType'] = propertyTypes.map((e) => e.toLowerCase()).join(',');
    }
    if (roomTypes != null && roomTypes.isNotEmpty) {
      queryParams['roomType'] = roomTypes.map((e) => e.toLowerCase().replaceAll(' ', '-')).join(',');
    }
    if (minBudget != null) queryParams['minBudget'] = minBudget;
    if (maxBudget != null) queryParams['maxBudget'] = maxBudget;

    final response = await _apiClient.get(
      '/properties',
      queryParameters: queryParams,
    );
    return PropertyResponse.fromJson(response.data);
  }

  Future<RecommendedResponse> getRecommendedProperties(
    Map<String, dynamic> data,
  ) async {
    final response = await _apiClient.post(
      '/properties/recommended-properties',
      data: data,
    );
    return RecommendedResponse.fromJson(response.data);
  }

  Future<ApiResponse> getTopProperties({int limit = 6}) async {
    final response = await _apiClient.get(
      '/properties/top-properties',
      queryParameters: {'limit': limit},
    );
    return ApiResponse.fromJson(response.data, null);
  }

  Future<PropertyResponse> getSimilarProperties({
    required String locality,
    int page = 1,
    int limit = 10,
  }) async {
    final response = await _apiClient.get(
      '/properties/similar-properties',
      queryParameters: {
        'locality': locality,
        'page': page,
        'limit': limit,
      },
    );
    return PropertyResponse.fromJson(response.data);
  }
}
