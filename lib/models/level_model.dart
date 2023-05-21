// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LevelModel {
  int levelId;
  String levelName;
  String levelDes;
  LevelModel({
    required this.levelId,
    required this.levelName,
    required this.levelDes,
  });

  factory LevelModel.fromJson(Map<String, dynamic> json) => LevelModel(
        levelId: json["level_id"],
        levelName: json["level_name"],
        levelDes: json["level_des"],
      );

  Map<String, dynamic> toJson() => {
        "level_id": levelId,
        "level_name": levelName,
        "level_des": levelDes,
      };
}

List<LevelModel> levelModelFromJson(String str) =>
    List<LevelModel>.from(json.decode(str).map((x) => LevelModel.fromJson(x)));

String levelModelToJson(List<LevelModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
