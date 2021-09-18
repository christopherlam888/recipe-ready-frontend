import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_ready/state.dart';

class Groceries extends StatefulWidget {
  @override
  _GroceriesState createState() => _GroceriesState();
}

class _GroceriesState extends State<Groceries> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe6ffe6),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 75.0),
        child: Container(
          child: Consumer<StateTracker>(builder: (context, state, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Day 1 - Day 7",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.0),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.groceries.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 8.0,
                        margin: new EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 6.0),
                        child: Container(
                          child: CheckboxListTile(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            title: Text(
                                "${num.tryParse(state.groceries.values.elementAt(index).quantity?.toStringAsFixed(2) ?? "") ?? ""} ${state.groceries.values.elementAt(index).unit ?? ""} ${state.groceries.keys.elementAt(index)}"),
                            value:
                                state.groceries.values.elementAt(index).checked,
                            secondary: Icon(Icons.image),
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
