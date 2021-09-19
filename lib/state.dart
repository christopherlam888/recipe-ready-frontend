import 'dart:collection';
import 'dart:convert';
import 'dart:ffi';

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
  final Map<String, Grocery> ingredients;

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

@JsonSerializable()
class Grocery {
  num? quantity;
  final String? unit;
  final num? calories;
  final num? price;

  @JsonKey(name: "image")
  final String imageLink;

  @JsonKey(name: "price_per_unit")
  final String? pricePerUnit;

  @JsonKey(ignore: true)
  bool checked = false;

  Grocery(this.quantity, this.unit, this.calories, this.price, this.imageLink,
      this.pricePerUnit);
  factory Grocery.fromJson(Map<String, dynamic> json) =>
      _$GroceryFromJson(json);
}

class StateTracker extends ChangeNotifier {
  static final String ROOT_URL = "https://api.eggworld.tk/recipes/";
  final List<Recipe> _recipes = [];
  List<Recipe> get recipes => _recipes;
  Map<String, Grocery> _groceries = Map(); // quantity (num), metadata (Grocery)
  Map<String, Grocery> get groceries => _groceries;

  // state
  Recipe activeRecipe = Recipe(
      "demo",
      "demo",
      "demo",
      1,
      1,
      "demo",
      {"demo": Grocery(1, "demo", 1, 1, "demo", "demo")},
      [],
      false,
      false,
      false,
      false,
      false,
      false);

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
    // if i in groceries increment the number and replace the unit
    // otherwise make a new one with all the metadata
    recipe.ingredients.forEach((i, d) {
      _groceries[i]?.checked = false;
      if (_groceries.containsKey(i)) {
        // add quantity
        final quantity = _groceries[i]?.quantity ?? 0;
        _groceries[i]?.quantity = quantity + (d.quantity ?? 0);
      } else {
        _groceries[i] = Grocery(d.quantity, d.unit, d.calories, d.price,
            d.imageLink, d.pricePerUnit);
      }
    });
    notifyListeners();
  }

  void removeRecipe(int index) {
    _recipes[index].ingredients.forEach((i, d) {
      if (_groceries.containsKey(i)) {
        // add quantity
        final quantity = _groceries[i]?.quantity ?? 0;
        _groceries[i]?.quantity = quantity - (d.quantity ?? 0);
        if (_groceries[i]!.quantity! <= 0) {
          // delete it
          _groceries.removeWhere((k, v) => k == i);
        }
      }
    });
    _recipes.removeAt(index);
    notifyListeners();
  }

  void replaceRecipe(Recipe recipe, int index) {
    removeRecipe(index);
    _recipes.insert(index, recipe);
    // to get that grocery calculation
    addRecipe(recipe);
    _recipes.removeAt(_recipes.length - 1);
    notifyListeners();
  }

  void clearRecipes() {
    _recipes.clear();
    _groceries.clear();
    notifyListeners();
  }

  void fetchReplaceRecipe(int index) async {
    Recipe recipe = (await fetchRecipes(1))[0];
    replaceRecipe(recipe, index);
  }

  void fetchMoreRecipes() async {
    // yikes
    List<Recipe> newRecipes = await fetchRecipes(numPeople * numDaysPlanned);
    newRecipes.forEach((element) {
      addRecipe(element);
    });
  }

  Future<List<Recipe>> fetchRecipes(int limit) async {
    final response = await http.get(Uri.parse(
        "$ROOT_URL?limit=$limit&vegan=$vegan&vegetarian=$vegetarian&halal=$halal&no_tree_nuts=$noTreenuts&no_dairy=$noDairy&no_peanuts=$noPeanuts"));
    if (response.statusCode == 200) {
      // TODO: do date processing
      return (jsonDecode(response.body) as List)
          .map((i) => Recipe.fromJson(i))
          .toList();
    } else {
      throw Exception("Failed to get new recipes.");
    }
  }
}
