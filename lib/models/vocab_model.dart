import 'dart:convert';


class VocabModel {
  VocabModel(
      {required this.vocabId,
      required this.quizId,
      required this.levelId,
      required this.vocabEng,
      required this.vocabTha,
      required this.vocabMeaning,
      required this.vocabType,
      required this.vocabChoice,
       this.vocabCorrectCount = 0,
       this.vocabWrongCount = 0});

  int vocabId;
  int quizId;
  int levelId;
  String vocabEng;
  String vocabTha;
  String vocabMeaning;
  String vocabType;
  String vocabChoice;
  int vocabCorrectCount;
  int vocabWrongCount;

  factory VocabModel.fromJson(Map<String, dynamic> json) => VocabModel(
        vocabId: json["vocab_id"],
        quizId: json["quiz_id"],
        levelId: json["level_id"] ,
        vocabEng: json["vocab_eng"]?? '',
        vocabTha: json["vocab_tha"]?? '',
        vocabMeaning: json["vocab_meaning"]?? '',
        vocabType: json["vocab_type"]?? '',
        vocabChoice: json["vocab_choice"]?? '',
        vocabCorrectCount: json["vocab_correct_count"] ?? 0,
        vocabWrongCount: json["vocab_wrong_count"] ?? 0,
      );

    Map<String, dynamic> toJson() => {
        "vocab_id": vocabId,
        "quiz_id": quizId,
        "level_id": levelId,
        "vocab_eng": vocabEng,
        "vocab_tha": vocabTha,
        "vocab_meaning": vocabMeaning,
        "vocab_type": vocabType,
        "vocab_choice": vocabChoice,
        "vocab_correct_count": vocabCorrectCount,
        "vocab_wrong_count": vocabWrongCount,
      };

}

List<VocabModel> vocabModelFromJson(String str) =>
    List<VocabModel>.from(json.decode(str).map((x) => VocabModel.fromJson(x)));

String vocabModelToJson(List<VocabModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}