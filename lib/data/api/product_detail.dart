import 'package:bedr/data/api/api.dart';
import 'package:bedr/data/api/models/api_response.dart';

class PropertyDetailApi {
  final ApiClient _apiClient = ApiClient();

  // Get single property full details
  Future<ApiResponse> getPropertyDetails(String propertySlug) async {
    final response = await _apiClient.get('/properties/details/$propertySlug');
    return ApiResponse.fromJson(response.data, null);
  }

  // Get properties in same locality
  Future<ApiResponse> getSimilarProperties({
    required String locality,
    int page = 1,
    int limit = 10,
  }) async {
    final response = await _apiClient.get(
      '/properties/similar-properties',
      queryParameters: {'locality': locality, 'page': page, 'limit': limit},
    );
    return ApiResponse.fromJson(response.data, null);
  }

  // Legacy methods (keeping for backward compatibility)
  Future<ApiResponse> getPropertyDetail(String propertyId) async {
    final response = await _apiClient.get('/properties/$propertyId');
    return ApiResponse.fromJson(response.data, null);
  }

  Future<ApiResponse> getPropertyImages(String propertyId) async {
    final response = await _apiClient.get('/properties/$propertyId/images');
    return ApiResponse.fromJson(response.data, null);
  }

  Future<ApiResponse> getPropertyReviews(String propertyId) async {
    final response = await _apiClient.get('/properties/$propertyId/reviews');
    return ApiResponse.fromJson(response.data, null);
  }

  Future<ApiResponse> addPropertyReview(
    String propertyId,
    Map<String, dynamic> data,
  ) async {
    final response = await _apiClient.post(
      '/properties/$propertyId/reviews',
      data: data,
    );
    return ApiResponse.fromJson(response.data, null);
  }
}
