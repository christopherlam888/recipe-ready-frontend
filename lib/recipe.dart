import 'package:flutter/material.dart';

class Recipe extends StatefulWidget {
  @override
  _RecipeState createState() => _RecipeState();
}

class _RecipeState extends State<Recipe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
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
                Text(
                    "Recipe",
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )
                ),
                SizedBox(height: 5.0),
                Text(
                  "Description of recipe...",
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
                    Text("Time"),
                    Icon(Icons.local_pizza),
                    Text("Yield"),
                  ],
                ),
                SizedBox(height: 5.0),
                Text(
                    "Ingredients",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    )
                ),
                SizedBox(height: 5.0),
                Text(
                    "Procedure",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}