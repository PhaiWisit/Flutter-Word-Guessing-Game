// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class QuizModel {
  int quizId;
  int levelId;
  int quizSeq;
  String quizName;
  int quizScore;
  int quizRate;
  String quizStatus;
  QuizModel({
    required this.quizId,
    required this.levelId,
    required this.quizSeq,
    required this.quizName,
    required this.quizScore,
    required this.quizRate,
    required this.quizStatus,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
        quizId: json['quiz_id'],
        levelId: json["level_id"],
        quizSeq: json["quiz_seq"],
        quizName: json["quiz_name"],
        quizScore: json["quiz_score"] ?? 0,
        quizRate: json["quiz_rate"] ?? 0,
        quizStatus: json["quiz_status"] ?? 'false',
      );

  Map<String, dynamic> toJson() => {
        "quiz_id": quizId,
        "level_id": levelId,
        "quiz_seq": quizSeq,
        "quiz_name": quizName,
        "quiz_score": quizScore,
        "quiz_rate": quizRate,
        "quiz_status": quizStatus,
      };
}

List<QuizModel> quizModelFromJson(String str) =>
      List<QuizModel>.from(json.decode(str).map((x) => QuizModel.fromJson(x)));

  String quizModelToJson(List<QuizModel> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
