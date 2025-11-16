import 'package:bedr/data/api/models/property.dart';

class RecommendedResponse {
  final List<RecommendedItem> data;
  final bool status;
  final String message;

  RecommendedResponse({
    required this.data,
    required this.status,
    required this.message,
  });

  factory RecommendedResponse.fromJson(Map<String, dynamic> json) {
    return RecommendedResponse(
      data: (json['data'] as List?)
              ?.map((e) => RecommendedItem.fromJson(e))
              .toList() ??
          [],
      status: json['status'] ?? false,
      message: json['message'] ?? '',
    );
  }
}

class RecommendedItem {
  final String id;
  final Property property;

  RecommendedItem({
    required this.id,
    required this.property,
  });

  factory RecommendedItem.fromJson(Map<String, dynamic> json) {
    return RecommendedItem(
      id: json['id'] ?? '',
      property: Property.fromJson(json['recPropsProperty'] ?? {}),
    );
  }
}
