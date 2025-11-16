class User {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String mobileNumber;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobileNumber,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      email: json['email'] ?? '',
      mobileNumber: json['mobileNumber'] ?? '',
    );
  }
}

class UserInfoResponse {
  final bool success;
  final User? data;

  UserInfoResponse({required this.success, this.data});

  factory UserInfoResponse.fromJson(Map<String, dynamic> json) {
    return UserInfoResponse(
      success: json['success'] ?? false,
      data: json['data'] != null ? User.fromJson(json['data']) : null,
    );
  }
}
