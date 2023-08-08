import 'package:hive/hive.dart';

class hiveDatabase {
  static Future getCart() async {
    // Create a box collection
    final collection = await BoxCollection.open(
      'DBook', // Name of your database
      {'cart', 'order'}, // Names of your boxes
      path:
          './', // Path where to store your boxes (Only used in Flutter / Dart IO)
      // key:  HiveCipher(), // Key to encrypt your boxes (Only used in Flutter / Dart IO)
    );
    final catsBox = collection.openBox<Map>('cart');
    
    // await catsBox.put('fluffy', {'name': 'Fluffy', 'age': 4});
  }
}
