import 'package:bedr/data/db/drift/database.dart';

class DatabaseProvider {
  static AppDatabase? _instance;
  
  static AppDatabase get instance {
    _instance ??= AppDatabase();
    return _instance!;
  }
  
  static void dispose() {
    _instance?.close();
    _instance = null;
  }
}
