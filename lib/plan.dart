import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:recipe_ready/state.dart';

class Plan extends StatefulWidget {
  @override
  _PlanState createState() => _PlanState();
}

class _PlanState extends State<Plan> {
  @override
  Widget build(BuildContext context) {
    if (Provider.of<StateTracker>(context, listen: false).recipes.length == 0) {
      return Scaffold(
        backgroundColor:
            Provider.of<StateTracker>(context, listen: false).darkMode
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
                      Provider.of<StateTracker>(context, listen: true).darkMode
                          ? "assets/wumpus_dark.png"
                          : "assets/wumpus.png")),
              Text(
                "Sorry, you do not have any saved recipes yet.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  color:
                      Provider.of<StateTracker>(context, listen: false).darkMode
                          ? Colors.white
                          : Colors.black,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                "Press \"Refresh Recipes\" to add some!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  color:
                      Provider.of<StateTracker>(context, listen: false).darkMode
                          ? Colors.white
                          : Colors.black,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Provider.of<StateTracker>(context, listen: false)
                  .fetchMoreRecipes();
            },
            backgroundColor: Colors.green.shade300,
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
            label: Text(
              "Refresh Recipes",
              style: TextStyle(
                color: Colors.black,
              ),
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
    } else {
      return Scaffold(
        backgroundColor:
            Provider.of<StateTracker>(context, listen: true).darkMode
                ? Colors.black87
                : Color(0xffe6ffe6),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
          child: Consumer<StateTracker>(builder: (context, state, child) {
            return GroupedListView<dynamic, String>(
              elements: state.recipes,
              groupBy: (element) => DateFormat.yMMMd().format(element.date),
              groupComparator: (value1, value2) => value2.compareTo(value1),
              itemComparator: (item1, item2) =>
                  item1.name.compareTo(item2.name),
              order: GroupedListOrder.DESC,
              // useStickyGroupSeparators: true,
              groupSeparatorBuilder: (String value) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  value,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: state.darkMode ? Colors.white : Colors.black),
                ),
              ),
              itemBuilder: (c, element) {
                return Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  actions: <Widget>[
                    IconSlideAction(
                      caption: "Favourite",
                      color: Colors.yellow[600],
                      icon: Icons.star_border_sharp,
                      onTap: () {},
                    ),
                  ],
                  secondaryActions: <Widget>[
                    IconSlideAction(
                      caption: "Delete",
                      color: Colors.red,
                      icon: Icons.delete,
                      onTap: () {
                        state.fetchReplaceRecipe(element);
                      },
                    ),
                  ],
                  child: Card(
                    elevation: 8.0,
                    margin: new EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 4.0),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          colorFilter: new ColorFilter.mode(
                              Colors.black.withOpacity(0.5), BlendMode.darken),
                          image: NetworkImage(element.imageLink),
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.center,
                        ),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        title: Text(
                          element.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                          textAlign: TextAlign.left,
                          maxLines: 3,
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.remove_red_eye, color: Colors.white),
                          onPressed: () {
                            state.activeRecipe = element;
                            Navigator.pushNamed(context, '/recipe');
                          },
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }),
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Provider.of<StateTracker>(context, listen: false)
                  .fetchMoreRecipes();
            },
            backgroundColor: Colors.green.shade300,
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
            label: Text(
              "Refresh Recipes",
              style: TextStyle(
                color: Colors.black,
              ),
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
    }
  }
}
