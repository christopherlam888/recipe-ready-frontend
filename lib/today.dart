import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_ready/state.dart';

class Today extends StatefulWidget {
  @override
  _TodayState createState() => _TodayState();
}

class _TodayState extends State<Today> {
  @override
  Widget build(BuildContext context) {
    if (Provider.of<StateTracker>(context, listen: false).recipes.length == 0){
      return Scaffold(
          backgroundColor: Color(0xffe6ffe6),
          body: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Sorry, you do not have any saved recipes yet.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  "To get started, have a look at the Plan tab!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          )
      );
    } else {
      return Scaffold(
        backgroundColor: Color(0xffe6ffe6),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 75.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Today's Recipes",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.0),
                Expanded(
                  child: Consumer<StateTracker>(builder: (context, state, child) {
                  return ListView.builder(
                    itemCount: state.todayRecipes.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 8.0,
                        margin: new EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 6.0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Icon(Icons.timer),
                                      Text(
                                        state.todayRecipes[index].prepTime
                                                ?.toString() ??
                                            "",
                                        style: TextStyle(fontSize: 14),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        state.todayRecipes[index].name,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Text(
                                        state.todayRecipes[index].description ??
                                            "",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      state.todayRecipes[index].imageLink ?? "",
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
        ),
      );
    }
  }
}
