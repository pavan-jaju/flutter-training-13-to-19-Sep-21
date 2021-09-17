import 'dart:io';

import 'package:flutter_taining_app_1/_repo/product_db_repo.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DbProvider {
  DbProvider._();

  static final DbProvider db = DbProvider._();

  Database? _database;

  Future<Database> get database async {
    if (_database == null) _database = await initDb();

    return _database!;
  }

  Future<Database> initDb() async {
    Directory docDir = await getApplicationDocumentsDirectory();
    String dbPath = join(docDir.path, "test.db");
    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute("CREATE TABLE ${ProductDbRepo.TABLE_NAME} ("
            "${ProductDbRepo.COL_OBJECT_ID} TEXT,"
            "${ProductDbRepo.COL_NAME} TEXT,"
            "${ProductDbRepo.COL_DESCRIPTION} TEXT,"
            "${ProductDbRepo.COL_IMAGE_URL} TEXT,"
            "${ProductDbRepo.COL_RATE} REAL"
            ")");
      },
    );
  }
}
