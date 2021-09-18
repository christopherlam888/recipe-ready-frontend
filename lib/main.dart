import 'package:flutter/material.dart';
import 'package:recipe_ready/nav.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/nav',
    routes:{
      '/nav' : (context) => Nav(),
    }
  ));
}
