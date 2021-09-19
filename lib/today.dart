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
    if (Provider.of<StateTracker>(context, listen: false).recipes.length == 0) {
      return Scaffold(
          backgroundColor:
              Provider.of<StateTracker>(context, listen: true).darkMode
                  ? Colors.black
                  : Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image(
                    image: AssetImage(
                        Provider.of<StateTracker>(context, listen: true)
                                .darkMode
                            ? "assets/wumpus_dark.png"
                            : "assets/wumpus.png")),
                Text(
                  "Sorry, you do not have any saved recipes yet.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22,
                      color: Provider.of<StateTracker>(context, listen: true)
                              .darkMode
                          ? Colors.white
                          : Colors.black),
                ),
                SizedBox(height: 20.0),
                Text(
                  "To get started, have a look at the Plan tab!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22,
                      color: Provider.of<StateTracker>(context, listen: true)
                              .darkMode
                          ? Colors.white
                          : Colors.black),
                ),
              ],
            ),
          ));
    } else {
      return Scaffold(
        backgroundColor:
            Provider.of<StateTracker>(context, listen: true).darkMode
                ? Colors.black
                : Colors.white,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 75.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Today's Recipes",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Provider.of<StateTracker>(context, listen: true)
                              .darkMode
                          ? Colors.white
                          : Colors.black),
                ),
                SizedBox(height: 10.0),
                Expanded(
                  child:
                      Consumer<StateTracker>(builder: (context, state, child) {
                    return ListView.builder(
                      itemCount: state.todayRecipes.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            state.activeRecipe = state.todayRecipes[index];
                            Navigator.pushNamed(context, '/recipe');
                          },
                          child: Card(
                            color: state.darkMode
                                ? Color.fromRGBO(70, 70, 70, 1)
                                : Colors.white,
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
                                          Icon(
                                            Icons.timer,
                                            color: state.darkMode
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                          Text(
                                            state.todayRecipes[index].prepTime
                                                    ?.toString() ??
                                                "",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: state.darkMode
                                                    ? Colors.white
                                                    : Colors.black),
                                          )
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 230,
                                            child: Text(
                                              state.todayRecipes[index].name,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: state.darkMode
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Container(
                                            width: 230,
                                            child: Text(
                                              state.todayRecipes[index]
                                                      .description ??
                                                  "",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          state.todayRecipes[index].imageLink ??
                                              "",
                                      placeholder: (context, url) =>
                                          CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                  ),
                                ],
                              ),
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
