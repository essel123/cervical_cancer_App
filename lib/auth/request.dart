// To parse this JSON data, do
//
//     final prediction = predictionFromJson(jsonString);

import 'dart:convert';

Prediction predictionFromJson(String str) =>
    Prediction.fromJson(json.decode(str));

String predictionToJson(Prediction data) => json.encode(data.toJson());

class Prediction {
  int biospyResults;

  Prediction({
    required this.biospyResults,
  });

  factory Prediction.fromJson(Map<String, dynamic> json) => Prediction(
        biospyResults: json["Biospy Results"],
      );

  Map<String, dynamic> toJson() => {
        "Biospy Results": biospyResults,
      };
}
