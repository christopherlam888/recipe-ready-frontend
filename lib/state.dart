import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
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
      this.noDairy);

  @JsonKey(required: true)
  final int id;

  @JsonKey(required: true)
  final String name;

  @JsonKey(name: "imglink")
  final String imageLink;

  @JsonKey(name: "prep_time")
  final int prepTime;
  final int yield;
  final String description;
  final Map<String, dynamic> ingredients;

  final List<String> steps;
  final bool vegan;
  final bool vegetarian;
  final bool halal;

  @JsonKey(name: "treenut_free")
  final bool noTreenuts;
  @JsonKey(name: "peanut_free")
  final bool noPeanuts;
  @JsonKey(name: "dairy_free")
  final bool noDairy;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}

class StateTracker extends ChangeNotifier {
  final List<Recipe> _recipes = [];
  UnmodifiableListView<Recipe> get recipes => UnmodifiableListView(_recipes);

  // settings
  int _numPeople = 1;
  int _mealsPerDay = 2;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _noDairy = false;
  bool _noTreenuts = false;
  bool _noPeanuts = false;

  int get numPeople => _numPeople;
  int get mealsPerDay => _mealsPerDay;

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
}
