class Property {
  final int id;
  final String propertyName;
  final String displayName;
  final String propertyType;
  final String accommodationType;
  final String locality;
  final String city;
  final String rentAmount;
  final double distance;
  final List<Room> rooms;
  final List<PropertyImage> propertyImages;
  final OwnerDetails ownerDetails;

  Property({
    required this.id,
    required this.propertyName,
    required this.displayName,
    required this.propertyType,
    required this.accommodationType,
    required this.locality,
    required this.city,
    required this.rentAmount,
    required this.distance,
    required this.rooms,
    required this.propertyImages,
    required this.ownerDetails,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    // Handle both regular and recommended API response formats
    final rooms = json['rooms'] ?? json['propRooms'] ?? [];
    final images = json['propertyImages'] ?? json['propPropertyImages'] ?? [];

    return Property(
      id: json['id'] ?? 0,
      propertyName: json['propertyName'] ?? '',
      displayName: json['displayName'] ?? '',
      propertyType: json['propertyType'] ?? 'pg',
      accommodationType: json['accommodationType'] ?? '',
      locality: json['locality'] ?? '',
      city: json['city'] ?? '',
      rentAmount: json['rentAmount'] ?? '0',
      distance: (json['distance'] ?? 0).toDouble(),
      rooms: (rooms as List).map((e) => Room.fromJson(e)).toList(),
      propertyImages: (images as List)
          .map((e) => PropertyImage.fromJson(e))
          .toList(),
      ownerDetails: OwnerDetails.fromJson(json['ownerDetails'] ?? {}),
    );
  }
}

class Room {
  final int id;
  final String name;
  final String type;
  final bool isAcAvailable;
  final String rentAmount;
  final String securityDeposit;

  Room({
    required this.id,
    required this.name,
    required this.type,
    required this.isAcAvailable,
    required this.rentAmount,
    required this.securityDeposit,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      type: json['type'] ?? '',
      isAcAvailable: json['isAcAvailable'] ?? false,
      rentAmount: json['rentAmount'] ?? '0',
      securityDeposit: json['securityDeposit'] ?? '0',
    );
  }
}

class PropertyImage {
  final String id;
  final int order;
  final PropImgM2 propImgM2;

  PropertyImage({
    required this.id,
    required this.order,
    required this.propImgM2,
  });

  factory PropertyImage.fromJson(Map<String, dynamic> json) {
    return PropertyImage(
      id: json['id'] ?? '',
      order: json['order'] ?? 0,
      propImgM2: PropImgM2.fromJson(json['propImgM2'] ?? {}),
    );
  }
}

class PropImgM2 {
  final String fileName;
  final String prefix;

  PropImgM2({required this.fileName, required this.prefix});

  factory PropImgM2.fromJson(Map<String, dynamic> json) {
    return PropImgM2(
      fileName: json['fileName'] ?? '',
      prefix: json['prefix'] ?? '',
    );
  }

  String get imageUrl =>
      'https://www.bedrindia.com/_next/image?url=%2Fapi%2F$prefix%2Ffile%2F$fileName&w=828&q=75';
  String get thumbnailUrl =>
      'https://www.bedrindia.com/_next/image?url=%2Fapi%2F$prefix%2Ffile%2F$fileName&w=400&q=75';
  String get fullImageUrl =>
      'https://www.bedrindia.com/_next/image?url=%2Fapi%2F$prefix%2Ffile%2F$fileName&w=1200&q=75';
}

class OwnerDetails {
  final String firstName;
  final String lastName;
  final String mobileNumber;

  OwnerDetails({
    required this.firstName,
    required this.lastName,
    required this.mobileNumber,
  });

  factory OwnerDetails.fromJson(Map<String, dynamic> json) {
    return OwnerDetails(
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      mobileNumber: json['mobileNumber'] ?? '',
    );
  }
}
