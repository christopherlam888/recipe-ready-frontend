// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipe _$RecipeFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'name'],
  );
  return Recipe(
    json['id'] as String,
    json['name'] as String,
    json['imglink'] as String?,
    json['prep_time'] as int?,
    json['yield'] as int?,
    json['description'] as String?,
    (json['ingredients'] as Map<String, dynamic>).map(
      (k, e) => MapEntry(k, Grocery.fromJson(e as Map<String, dynamic>)),
    ),
    (json['steps'] as List<dynamic>?)?.map((e) => e as String).toList(),
    json['vegan'] as bool,
    json['vegetarian'] as bool,
    json['halal'] as bool,
    json['treenut_free'] as bool,
    json['peanut_free'] as bool,
    json['dairy_free'] as bool,
  );
}

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imglink': instance.imageLink,
      'prep_time': instance.prepTime,
      'yield': instance.yield,
      'description': instance.description,
      'ingredients': instance.ingredients,
      'steps': instance.steps,
      'vegan': instance.vegan,
      'vegetarian': instance.vegetarian,
      'halal': instance.halal,
      'treenut_free': instance.noTreenuts,
      'peanut_free': instance.noPeanuts,
      'dairy_free': instance.noDairy,
    };

Grocery _$GroceryFromJson(Map<String, dynamic> json) => Grocery(
      json['quantity'] as num?,
      json['unit'] as String?,
      json['calories'] as num?,
      json['price'] as num?,
      json['image'] as String,
      json['price_per_unit'] as String?,
    );

Map<String, dynamic> _$GroceryToJson(Grocery instance) => <String, dynamic>{
      'quantity': instance.quantity,
      'unit': instance.unit,
      'calories': instance.calories,
      'price': instance.price,
      'image': instance.imageLink,
      'price_per_unit': instance.pricePerUnit,
    };
