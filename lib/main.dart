import 'package:flutter/material.dart';
import 'package:recipe_ready/nav.dart';
import 'package:recipe_ready/plan.dart';
import 'package:recipe_ready/today.dart';
import 'package:recipe_ready/groceries.dart';
import 'package:recipe_ready/settings.dart';
import 'package:recipe_ready/recipe.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/nav',
    routes:{
      '/nav' : (context) => Nav(),
      '/plan' : (context) => Plan(),
      '/today' : (context) => Today(),
      '/groceries' : (context) => Groceries(),
      '/settings' : (context) => Settings(),
      '/recipe' : (context) => Recipe(),
    }
  ));
}
