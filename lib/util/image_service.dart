class ImageService {
  static const String _baseImageUrl = 'https://www.bedrindia.com/_next/image';
  static const String _mediaBaseUrl = 'https://media2.bedrindia.com';

  // Get optimized image URL from bedrindia
  static String getImageUrl(String fileName, {int? width, int? height, int quality = 75}) {
    final imageUrl = '$_mediaBaseUrl/$fileName';
    String url = '$_baseImageUrl?url=$imageUrl&q=$quality';
    
    if (width != null) url += '&w=$width';
    if (height != null) url += '&h=$height';
    
    return url;
  }

  // Get direct media URL
  static String getDirectImageUrl(String fileName) {
    return '$_mediaBaseUrl/$fileName';
  }

  // Get thumbnail URL
  static String getThumbnailUrl(String fileName) {
    return getImageUrl(fileName, width: 300, height: 200);
  }

  // Get full size image URL
  static String getFullImageUrl(String fileName) {
    return getImageUrl(fileName, width: 1200, height: 800);
  }
}
