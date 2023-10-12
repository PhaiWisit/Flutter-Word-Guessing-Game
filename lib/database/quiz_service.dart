
import 'dart:convert';
import 'package:sqflite/sqflite.dart';
import 'package:word_test/database/database_helper.dart';
import 'package:word_test/models/quiz_model.dart';

class QuizService {
  final dbHelper = DatabaseHelper.instance;

  Future<List<QuizModel>> getQuizList({required level}) async {
    Database db = await dbHelper.database;
    List<Map<String, dynamic>> rows = await db.rawQuery('SELECT * FROM quizzes WHERE level_id = $level');
    String jsonString = json.encode(rows);
    List<QuizModel> quizList = quizModelFromJson(jsonString);
    return quizList;
  }

  Future<int> updateScoreAndRate(int id,int score,int rate) async {
    Database db = await dbHelper.database;
    return await db.rawUpdate('UPDATE quizzes SET quiz_score = $score , quiz_rate = $rate WHERE quiz_id = $id');
  }
}