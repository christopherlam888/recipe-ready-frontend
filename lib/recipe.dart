import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_ready/state.dart';

class Recipe extends StatefulWidget {
  @override
  _RecipeState createState() => _RecipeState();
}

class _RecipeState extends State<Recipe> {
  List<String> ingredients = [
    "Old shoes",
    "Horse manure",
    "Chemistry textbooks"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe6ffe6),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 2.0,
                spreadRadius: 0.0,
                offset: Offset(2.0, 2.0), // shadow direction: bottom right
              )
            ],
          ),
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Consumer<StateTracker>(builder: (context, state, child) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            alignment: Alignment.topRight,
                            icon: Icon(Icons.close),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                      Text(state.activeRecipe.name,
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          )),
                      SizedBox(height: 5.0),
                      Text(
                        state.activeRecipe.description ?? "",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Center(
                            child: CachedNetworkImage(
                                // TODO: non idea why this is broken fix it later
                                imageUrl: state.activeRecipe.imageLink ?? "",
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error))),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.timer),
                          Text(
                              "${state.activeRecipe.prepTime?.toString()} min"),
                          Icon(Icons.local_pizza),
                          // TODO: hide them if they are null
                          Text(
                              "${state.activeRecipe.yield?.toString()} serving(s)"),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text("Ingredients",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                            )),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: state.activeRecipe.ingredients.entries
                            .map((ing) => Column(
                              children: [
                                if(ing.value.quantity == 0) ...[
                                  Text(
                                      "• ${ing.key}",
                                      style: TextStyle(fontSize: 16.0)),
                                ] else ...[
                                  Text(
                                      "• ${num.tryParse(ing.value.quantity?.toStringAsFixed(1) ?? "") ?? ""} ${ing.value.unit ?? ""} ${ing.key}",
                                      style: TextStyle(fontSize: 16.0)),
                                ]
                              ],
                            ))
                            .toList(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text("Procedure",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                            )),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: state.activeRecipe.steps!
                            .map((step) => Column(
                              children: [
                                Text("• " + step,
                                    style: TextStyle(fontSize: 16.0)),
                                SizedBox(height: 10.0),
                              ],
                            ))
                            .toList(),
                      ),
                    ],
                  ),
                );
              })),
        ),
      ),
    );
  }
}
