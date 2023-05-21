// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class QuizModel {
  int quizId;
  int levelId;
  String quizName;
  String quizScore;
  String quizRate;
  QuizModel({
    required this.quizId,
    required this.levelId,
    required this.quizName,
    required this.quizScore,
    required this.quizRate,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
        quizId: json['quiz_id'],
        levelId: json["level_id"],
        quizName: json["quiz_name"],
        quizScore: json["quiz_score"],
        quizRate: json["quiz_rate"],
      );

  Map<String, dynamic> toJson() => {
        "quiz_id": quizId,
        "level_id": levelId,
        "quiz_name": quizName,
        "quiz_score": quizScore,
        "quiz_rate": quizRate,
      };

  List<QuizModel> quizModelFromJson(String str) =>
      List<QuizModel>.from(json.decode(str).map((x) => QuizModel.fromJson(x)));

  String quizModelToJson(List<QuizModel> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}
