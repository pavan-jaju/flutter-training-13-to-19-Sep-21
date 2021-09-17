import 'package:flutter_taining_app_1/_database/db_provider.dart';
import 'package:flutter_taining_app_1/_model/product.dart';
import 'package:sqflite/sqflite.dart';

class ProductDbRepo {
  Future<Database> get db async => DbProvider.db.database;

  static const String TABLE_NAME = "Product";
  static const String COL_OBJECT_ID = "objectId";
  static const String COL_DESCRIPTION = "description";
  static const String COL_NAME = "name";
  static const String COL_RATE = "price";
  static const String COL_IMAGE_URL = "image";

  add(Product product) async {
    final _db = await db;
    await _db.insert(TABLE_NAME, product.toMap());
  }

  Future<List<Product>> listAll() async {
    final _db = await db;
    var res = await _db.query(
      TABLE_NAME,
    );
    return res.map<Product>((p) => Product.fromMap(p)).toList();
  }

  Future<Product?> get(String id) async {
    final _db = await db;
    var res = await _db
        .query(TABLE_NAME, where: "$COL_OBJECT_ID = ?", whereArgs: [id]);
    return res.isEmpty ? null : Product.fromMap(res.first);
  }
}
