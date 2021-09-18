import 'dart:collection';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

part 'state.g.dart';

@JsonSerializable()
class Recipe {
  Recipe(
    this.id,
    this.name,
    this.imageLink,
    this.prepTime,
    this.yield,
    this.description,
    this.ingredients,
    this.steps,
    this.vegan,
    this.vegetarian,
    this.halal,
    this.noTreenuts,
    this.noPeanuts,
    this.noDairy,
  );

  @JsonKey(required: true)
  final String id;

  @JsonKey(required: true)
  final String name;

  @JsonKey(name: "imglink")
  final String? imageLink;

  @JsonKey(name: "prep_time")
  final int? prepTime;
  final int? yield;
  final String? description;
  final Map<String, dynamic> ingredients;

  final List<String>? steps;
  final bool vegan;
  final bool vegetarian;
  final bool halal;

  @JsonKey(name: "treenut_free")
  final bool noTreenuts;
  @JsonKey(name: "peanut_free")
  final bool noPeanuts;
  @JsonKey(name: "dairy_free")
  final bool noDairy;

  @JsonKey(ignore: true)
  DateTime date = DateTime(2000, 01, 01);

  int compareTo(Recipe other) => this.date.compareTo(other.date);

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}

class StateTracker extends ChangeNotifier {
  static final String ROOT_URL = "https://api.eggworld.tk/recipes/";
  final List<Recipe> _recipes = [];
  List<Recipe> get recipes => _recipes;

  // state
  Recipe activeRecipe = Recipe("demo", "demo", "demo", 1, 1, "demo",
      {"demo": 1}, [], false, false, false, false, false, false);

  // settings
  int numPeople = 1;
  int mealsPerDay = 2;
  int numDaysPlanned = 7;
  bool vegan = false;
  bool vegetarian = false;
  bool noDairy = false;
  bool noTreenuts = false;
  bool noPeanuts = false;
  bool halal = false;

  StateTracker() {
    fetchMoreRecipes();
  }

  void addRecipe(Recipe recipe) {
    _recipes.add(recipe);
    notifyListeners();
  }

  void removeRecipe(int index) {
    _recipes.removeAt(index);
    notifyListeners();
  }

  void replaceRecipe(Recipe recipe, int index) {
    _recipes.removeAt(index);
    _recipes.insert(index, recipe);
    notifyListeners();
  }

  void fetchMoreRecipes() async {
    final response = await http.get(Uri.parse(
        "$ROOT_URL?limit=$numPeople&vegan=$vegan&vegetarian=$vegetarian&halal=$halal&no_tree_nuts=$noTreenuts&no_dairy=$noDairy&no_peanuts=$noPeanuts"));
    if (response.statusCode == 200) {
      // TODO: do date processing
      _recipes.addAll((jsonDecode(response.body) as List)
          .map((i) => Recipe.fromJson(i))
          .toList());
      notifyListeners();
    } else {
      throw Exception("Failed to get new recipes.");
    }
  }
}
