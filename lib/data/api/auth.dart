import 'package:dio/dio.dart';
import 'package:bedr/data/api/api.dart';
import 'package:bedr/data/api/models/user.dart';
import 'package:bedr/data/api/models/api_response.dart';

class AuthApi {
  final ApiClient _apiClient = ApiClient();

  Future<UserInfoResponse> getUserInfo() async {
    final response = await _apiClient.get('/users/userInfo');
    return UserInfoResponse.fromJson(response.data);
  }

  Future<ApiResponse> login(Map<String, dynamic> data) async {
    final response = await _apiClient.post('/auth/login', data: data);
    return ApiResponse.fromJson(response.data, null);
  }

  Future<ApiResponse> register(Map<String, dynamic> data) async {
    final response = await _apiClient.post('/auth/register', data: data);
    return ApiResponse.fromJson(response.data, null);
  }

  Future<ApiResponse> logout() async {
    final response = await _apiClient.post('/auth/logout');
    return ApiResponse.fromJson(response.data, null);
  }
}
