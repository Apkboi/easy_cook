// To parse this JSON data, do
//
//     final cookingStep = cookingStepFromJson(jsonString);

import 'dart:convert';

CookingStep cookingStepFromJson(String str) => CookingStep.fromJson(json.decode(str));

String cookingStepToJson(CookingStep data) => json.encode(data.toJson());

class CookingStep {
  final String description;
  final List<Timing> timing;
  final String tittle;
  final double totalDuration;

  CookingStep({
    required this.description,
    required this.timing,
    required this.tittle,
    required this.totalDuration,
  });

  CookingStep copyWith({
    String? description,
    List<Timing>? timing,
    String? tittle,
    double? totalDuration,
  }) =>
      CookingStep(
        description: description ?? this.description,
        timing: timing ?? this.timing,
        tittle: tittle ?? this.tittle,
        totalDuration: totalDuration ?? this.totalDuration,
      );

  factory CookingStep.fromJson(Map<String, dynamic> json) => CookingStep(
    description: json["description"],
    timing: List<Timing>.from(json["timing"].map((x) => Timing.fromJson(x))),
    tittle: json["tittle"],
    totalDuration: json["total_duration"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "description": description,
    "timing": List<dynamic>.from(timing.map((x) => x.toJson())),
    "tittle": tittle,
    "total_duration": totalDuration,
  };
}

class Timing {
  final double durationInMinutes;
  final String timingFor;

  Timing({
    required this.durationInMinutes,
    required this.timingFor,
  });

  Timing copyWith({
    double? durationInMinutes,
    String? timingFor,
  }) =>
      Timing(
        durationInMinutes: durationInMinutes ?? this.durationInMinutes,
        timingFor: timingFor ?? this.timingFor,
      );

  factory Timing.fromJson(Map<String, dynamic> json) => Timing(
    durationInMinutes: json["duration_in_minutes"]?.toDouble(),
    timingFor: json["timing_for"],
  );

  Map<String, dynamic> toJson() => {
    "duration_in_minutes": durationInMinutes,
    "timing_for": timingFor,
  };
}
