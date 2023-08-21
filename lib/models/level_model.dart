// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LevelModel {
  int levelId;
  String levelName;
  String levelDes1;
  String levelDes2;
  LevelModel({
    required this.levelId,
    required this.levelName,
    required this.levelDes1,
    required this.levelDes2,
  });

  factory LevelModel.fromJson(Map<String, dynamic> json) => LevelModel(
        levelId: json["level_id"],
        levelName: json["level_name"],
        levelDes1: json["level_des1"],
        levelDes2: json["level_des2"],
      );

  Map<String, dynamic> toJson() => {
        "level_id": levelId,
        "level_name": levelName,
        "level_des1": levelDes1,
        "level_des2": levelDes2,
      };
}

List<LevelModel> levelModelFromJson(String str) =>
    List<LevelModel>.from(json.decode(str).map((x) => LevelModel.fromJson(x)));

String levelModelToJson(List<LevelModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
