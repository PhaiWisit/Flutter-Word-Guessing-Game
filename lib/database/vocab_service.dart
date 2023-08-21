import 'dart:convert';
import 'package:sqflite/sqflite.dart';
import 'package:word_test/database/database_helper.dart';

import '../models/vocab_model.dart';

class VocabService {
  final dbHelper = DatabaseHelper.instance;

  Future<List<VocabModel>> getVocabList({required level,required quiz}) async {
    Database db = await dbHelper.database;
    List<Map<String, dynamic>> rows =
        await db.rawQuery('SELECT * FROM vocabs WHERE level_id = $level AND quiz_id = $quiz');
    String jsonString = json.encode(rows);
    List<VocabModel> vocabList = vocabModelFromJson(jsonString);
    return vocabList;
  }
  Future<List<VocabModel>> getRandomVocabList() async {
    Database db = await dbHelper.database;
    List<Map<String, dynamic>> rows =
        await db.rawQuery('SELECT * FROM vocabs ORDER BY RANDOM() LIMIT 20');
    String jsonString = json.encode(rows);
    List<VocabModel> vocabList = vocabModelFromJson(jsonString);
    return vocabList;
  }



}
