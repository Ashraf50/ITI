import 'package:flutter_application_1/feature/home/data/model/recipes_model/recipes_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DatabaseHelper {
  static Database? _database;
  static const String _tableName = 'recipes';
  static const String _databaseName = 'recipes.db';

  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  static Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $_tableName (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            image TEXT,
            rating REAL,
            prepTimeMinutes INTEGER
          )
        ''');
      },
    );
  }

  static Future<int> insertRecipe(RecipesModel recipe) async {
    final db = await database;
    return await db.insert(
      _tableName,
      recipe.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<RecipesModel>> getRecipes() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(_tableName);
    return List.generate(maps.length, (i) {
      return RecipesModel.fromMap(maps[i]);
    });
  }

  static Future<int> deleteRecipe(int id) async {
    final db = await database;
    return await db.delete(_tableName, where: 'id = ?', whereArgs: [id]);
  }
}
