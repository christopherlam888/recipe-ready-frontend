import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_ready/state.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 75.0),
          child: Container(
            child: Consumer<StateTracker>(builder: (context, state, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Settings",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Dietary Restrictions",
                    style: TextStyle(fontSize: 20),
                  ),
                  SwitchListTile(
                    title: Text("Vegetarian"),
                    activeColor: Colors.black,
                    value: state.vegetarian,
                    onChanged: (bool value) {
                      setState(() {
                        state.vegetarian = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text("Vegan"),
                    activeColor: Colors.black,
                    value: state.vegan,
                    onChanged: (bool value) {
                      setState(() {
                        state.vegan = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text("Tree nut-free"),
                    activeColor: Colors.black,
                    value: state.noTreenuts,
                    onChanged: (bool value) {
                      setState(() {
                        state.noTreenuts = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text("Peanut-free"),
                    activeColor: Colors.black,
                    value: state.noPeanuts,
                    onChanged: (bool value) {
                      setState(() {
                        state.noPeanuts = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text("Dairy-free"),
                    activeColor: Colors.black,
                    value: state.noDairy,
                    onChanged: (bool value) {
                      setState(() {
                        state.noDairy = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text("Halal"),
                    activeColor: Colors.black,
                    value: state.halal,
                    onChanged: (bool value) {
                      setState(() {
                        state.halal = value;
                      });
                    },
                  ),
                  Text(
                    "Meals",
                    style: TextStyle(fontSize: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Servings",
                          style: TextStyle(fontSize: 16),
                        ),
                        DropdownButton<String>(
                          value: state.numPeople.toString(),
                          icon: const Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(color: Colors.black),
                          underline: Container(height: 2, color: Colors.black),
                          onChanged: (String? newValue) {
                            setState(() {
                              state.numPeople = int.parse(newValue!);
                            });
                          },
                          items: <String>[
                            '1',
                            '2',
                            '3',
                            '4',
                            '5',
                            '6',
                            '7',
                            '8'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Meals per day",
                          style: TextStyle(fontSize: 16),
                        ),
                        DropdownButton<String>(
                          value: state.mealsPerDay.toString(),
                          icon: const Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(color: Colors.black),
                          underline: Container(height: 2, color: Colors.black),
                          onChanged: (String? newValue) {
                            setState(() {
                              state.mealsPerDay = int.parse(newValue!);
                            });
                          },
                          items: <String>['1', '2', '3', '4', '5']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Days to plan",
                          style: TextStyle(fontSize: 16),
                        ),
                        DropdownButton<String>(
                          value: state.numDaysPlanned.toString(),
                          icon: const Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(color: Colors.black),
                          underline: Container(height: 2, color: Colors.black),
                          onChanged: (String? newValue) {
                            setState(() {
                              state.numDaysPlanned = int.parse(newValue!);
                            });
                          },
                          items: <String>[
                            '1',
                            '2',
                            '3',
                            '4',
                            '5',
                            '6',
                            '7',
                            '8',
                            '9',
                            '10',
                            '11',
                            '12',
                            '13',
                            '14'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
