// To parse this JSON data, do
//
//     final recipeModel = recipeModelFromJson(jsonString);

import 'dart:convert';

RecipeModel recipeModelFromJson(String str) => RecipeModel.fromJson(json.decode(str));

String recipeModelToJson(RecipeModel data) => json.encode(data.toJson());

class RecipeModel {
  final String id;
  final String categoryId;
  final String description;
  final double durationInMinutes;
  final List<String> images;
  final String name;
  final String publishedBy;
  final String recipeBy;
  final int servings;
  final String tutorial;
  final String categoryName;
  final List<Ingredient> ingredients;

  RecipeModel({
    required this.id,
    required this.categoryId,
    required this.description,
    required this.durationInMinutes,
    required this.images,
    required this.name,
    required this.publishedBy,
    required this.recipeBy,
    required this.servings,
    required this.tutorial,
    required this.categoryName,
    required this.ingredients,
  });

  RecipeModel copyWith({
    String? id,
    String? categoryId,
    String? description,
    double? durationInMinutes,
    List<String>? images,
    String? name,
    String? publishedBy,
    String? recipeBy,
    int? servings,
    String? tutorial,
    String? categoryName,
    List<Ingredient>? ingredients,
  }) =>
      RecipeModel(
        id: id ?? this.id,
        categoryId: categoryId ?? this.categoryId,
        description: description ?? this.description,
        durationInMinutes: durationInMinutes ?? this.durationInMinutes,
        images: images ?? this.images,
        name: name ?? this.name,
        publishedBy: publishedBy ?? this.publishedBy,
        recipeBy: recipeBy ?? this.recipeBy,
        servings: servings ?? this.servings,
        tutorial: tutorial ?? this.tutorial,
        categoryName: categoryName ?? this.categoryName,
        ingredients: ingredients ?? this.ingredients,
      );

  factory RecipeModel.fromJson(Map<String, dynamic> json) => RecipeModel(
    id: json["id"],
    categoryId: json["category_id"],
    description: json["description"],
    durationInMinutes: json["duration_in_minutes"]?.toDouble(),
    images: List<String>.from(json["images"].map((x) => x)),
    name: json["name"],
    publishedBy: json["published_by"],
    recipeBy: json["recipe_by"],
    servings: json["servings"],
    tutorial: json["tutorial"],
    categoryName: json["category_name"],
    ingredients: List<Ingredient>.from(json["ingredients"].map((x) => Ingredient.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_id": categoryId,
    "description": description,
    "duration_in_minutes": durationInMinutes,
    "images": List<dynamic>.from(images.map((x) => x)),
    "name": name,
    "published_by": publishedBy,
    "recipe_by": recipeBy,
    "servings": servings,
    "tutorial": tutorial,
    "category_name": categoryName,
    "ingredients": List<dynamic>.from(ingredients.map((x) => x.toJson())),
  };
}

class Ingredient {
  final String id;
  final String name;
  final String image;
  final String quantity;

  Ingredient({
    required this.id,
    required this.name,
    required this.image,
    required this.quantity,
  });

  Ingredient copyWith({
    String? id,
    String? name,
    String? image,
    String? quantity,
  }) =>
      Ingredient(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        quantity: quantity ?? this.quantity,
      );

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "quantity": quantity,
  };
}
