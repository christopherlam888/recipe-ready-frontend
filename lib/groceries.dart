import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_ready/state.dart';

class Groceries extends StatefulWidget {
  @override
  _GroceriesState createState() => _GroceriesState();
}

class _GroceriesState extends State<Groceries> {
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
          ));
    } else {
      return Scaffold(
        backgroundColor:
            Provider.of<StateTracker>(context, listen: false).darkMode
                ? Colors.black
                : Colors.white,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 75.0),
          child: Container(
            child: Consumer<StateTracker>(builder: (context, state, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Next ${state.numDaysPlanned} day(s)",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: state.darkMode ? Colors.white : Colors.black),
                  ),
                  SizedBox(height: 10.0),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.groceries.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 8.0,
                          color: Colors.white,
                          margin: new EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 6.0),
                          child: Container(
                            child: CheckboxListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              title: Column(
                                children: [
                                  if(state.groceries.values
                                      .elementAt(index)
                                      .quantity == 0) ...[
                                    Text(
                                        "${state.groceries.keys
                                            .elementAt(index)}",
                                        style: TextStyle(fontSize: 16.0)),
                                  ] else ...[
                                    Text(
                                        "${num.tryParse(state.groceries.values
                                            .elementAt(index)
                                            .quantity
                                            ?.toStringAsFixed(1) ?? "") ?? ""} ${state
                                            .groceries.values
                                            .elementAt(index)
                                            .unit ?? ""} ${state.groceries.keys
                                            .elementAt(index)}"),
                                  ]
                                ],
                              ),
                              value:
                              state.groceries.values
                                  .elementAt(index)
                                  .checked,
                              secondary: CachedNetworkImage(
                                imageUrl: state.groceries.values
                                    .elementAt(index)
                                    .imageLink,
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                              controlAffinity: ListTileControlAffinity.leading,
                              onChanged: (bool? value) {
                                setState(() {
                                  state.groceries.values
                                      .elementAt(index)
                                      .checked = value!;
                                });
                              },
                              activeColor: Colors.green,
                              checkColor: Colors.white,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Provider.of<StateTracker>(context, listen: false).clearRecipes();
            },
            backgroundColor: Color(0xff990000),
            icon: Icon(
              Icons.clear,
              color: Colors.white,
            ),
            label: Text(
              "Reset All",
              style: TextStyle(
                color: Colors.white,
              ),
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
    }
  }
}
