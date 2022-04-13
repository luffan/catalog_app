import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/product.dart';

class DbProvider {
  late final Future<Database> _database;

  Future<void> init() async {
    _database = openDatabase(
      join(await getDatabasesPath(), 'catalog.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE products('
          'id INTEGER PRIMARY KEY,'
          'title TEXT,'
          'category String,'
          'price DOUBLE,'
          'description String,'
          'image String'
          ')',
        );
      },
      version: 1,
    );
  }

  Future<List<Product>> get products async {
    final db = await _database;

    final dbProducts = await db.query('products');

    return dbProducts.map((e) => Product.fromJson(e)).toList();
  }

  Future<void> insertProducts(List<Product> products) async {
    final db = await _database;

    for (final product in products) {
      await db.insert(
        'products',
        product.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

}
