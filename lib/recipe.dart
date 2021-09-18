import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_ready/state.dart';

class Recipe extends StatefulWidget {
  @override
  _RecipeState createState() => _RecipeState();
}

class _RecipeState extends State<Recipe> {
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
          ),
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Consumer<StateTracker>(builder: (context, state, child) {
                return Column(
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
                          fontSize: 40.0,
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
                      child: Center(child: Icon(Icons.image)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.timer),
                        Text(
                            "${state.activeRecipe.prepTime?.toString()} min(s)"),
                        Icon(Icons.local_pizza),
                        // TODO: hide them if they are null
                        Text(
                            "${state.activeRecipe.yield?.toString()} serving(s)"),
                      ],
                    ),
                    SizedBox(height: 5.0),
                    Text("Ingredients",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                        )),
                    SizedBox(height: 5.0),
                    Text("Procedure",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                        )),
                  ],
                );
              })),
        ),
      ),
    );
  }
}
