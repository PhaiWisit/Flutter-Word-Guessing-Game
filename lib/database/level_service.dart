
import 'dart:convert';

import 'package:sqflite/sqflite.dart';
import 'package:word_test/models/level_model.dart';

import 'database_helper.dart';

class LevelService {
   final dbHelper = DatabaseHelper.instance;

  Future<List<LevelModel>> getLevelList() async {
    Database db = await dbHelper.database;
    List<Map<String, dynamic>> rows = await db.query('levels');
    String jsonString = json.encode(rows);
    List<LevelModel> levelList = levelModelFromJson(jsonString);
    return levelList;
  }
}