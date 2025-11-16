import 'package:bedr/data/api/models/property.dart';

class PropertyResponse {
  final bool success;
  final PropertyData data;

  PropertyResponse({required this.success, required this.data});

  factory PropertyResponse.fromJson(Map<String, dynamic> json) {
    return PropertyResponse(
      success: json['success'] ?? false,
      data: PropertyData.fromJson(json['data'] ?? {}),
    );
  }
}

class PropertyData {
  final List<Property> docs;
  final int totalDocs;
  final int totalPages;
  final int page;
  final int limit;

  PropertyData({
    required this.docs,
    required this.totalDocs,
    required this.totalPages,
    required this.page,
    required this.limit,
  });

  factory PropertyData.fromJson(Map<String, dynamic> json) {
    return PropertyData(
      docs: (json['docs'] as List?)?.map((e) => Property.fromJson(e)).toList() ?? [],
      totalDocs: json['totalDocs'] ?? 0,
      totalPages: json['totalPages'] ?? 0,
      page: json['page'] ?? 0,
      limit: json['limit'] ?? 0,
    );
  }
}
