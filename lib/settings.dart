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
      backgroundColor: Provider.of<StateTracker>(context, listen: true).darkMode
          ? Colors.black
          : Colors.white,
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
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: state.darkMode ? Colors.white : Colors.black),
                  ),
                  SizedBox(height: 10.0),
                  SwitchListTile(
                    title: Text("Dark mode",
                        style: TextStyle(
                            color:
                                state.darkMode ? Colors.white : Colors.black)),
                    activeColor: Colors.green,
                    inactiveTrackColor: Colors.grey,
                    value: state.darkMode,
                    onChanged: (bool value) {
                      setState(() {
                        state.darkMode = value;
                      });
                    },
                  ),
                  Text(
                    "Dietary Restrictions",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: state.darkMode ? Colors.white : Colors.black),
                  ),
                  SwitchListTile(
                    title: Text("Vegetarian",
                        style: TextStyle(
                            color:
                                state.darkMode ? Colors.white : Colors.black)),
                    activeColor: Colors.green,
                    inactiveTrackColor: Colors.grey,
                    value: state.vegetarian,
                    onChanged: (bool value) {
                      setState(() {
                        state.vegetarian = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text("Vegan",
                        style: TextStyle(
                            color:
                                state.darkMode ? Colors.white : Colors.black)),
                    activeColor: Colors.green,
                    inactiveTrackColor: Colors.grey,
                    value: state.vegan,
                    onChanged: (bool value) {
                      setState(() {
                        state.vegan = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text("Tree nut-free",
                        style: TextStyle(
                            color:
                                state.darkMode ? Colors.white : Colors.black)),
                    activeColor: Colors.green,
                    inactiveTrackColor: Colors.grey,
                    value: state.noTreenuts,
                    onChanged: (bool value) {
                      setState(() {
                        state.noTreenuts = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text("Peanut-free",
                        style: TextStyle(
                            color:
                                state.darkMode ? Colors.white : Colors.black)),
                    activeColor: Colors.green,
                    inactiveTrackColor: Colors.grey,
                    value: state.noPeanuts,
                    onChanged: (bool value) {
                      setState(() {
                        state.noPeanuts = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text("Dairy-free",
                        style: TextStyle(
                            color:
                                state.darkMode ? Colors.white : Colors.black)),
                    activeColor: Colors.green,
                    inactiveTrackColor: Colors.grey,
                    value: state.noDairy,
                    onChanged: (bool value) {
                      setState(() {
                        state.noDairy = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text("Halal",
                        style: TextStyle(
                            color:
                                state.darkMode ? Colors.white : Colors.black)),
                    activeColor: Colors.green,
                    inactiveTrackColor: Colors.grey,
                    value: state.halal,
                    onChanged: (bool value) {
                      setState(() {
                        state.halal = value;
                      });
                    },
                  ),
                  Text(
                    "Meals",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: state.darkMode ? Colors.white : Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Servings",
                          style: TextStyle(
                              fontSize: 16,
                              color:
                                  state.darkMode ? Colors.white : Colors.black),
                        ),
                        Theme(
                          data: Theme.of(context).copyWith(
                            canvasColor: state.darkMode
                                ? Colors.black
                                : Colors.white,
                          ),
                          child: DropdownButton<String>(
                            value: state.numPeople.toString(),
                            icon: const Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 16,
                            style: TextStyle(
                                color:
                                    state.darkMode ? Colors.white : Colors.black),
                            underline: Container(height: 2, color: Colors.green),
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
                                child: Text(value,
                                    style: TextStyle(
                                        color: state.darkMode
                                            ? Colors.white
                                            : Colors.black)),
                              );
                            }).toList(),
                          ),
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
                          style: TextStyle(
                              fontSize: 16,
                              color:
                                  state.darkMode ? Colors.white : Colors.black),
                        ),
                        Theme(
                          data: Theme.of(context).copyWith(
                            canvasColor: state.darkMode
                                ? Colors.black
                                : Colors.white,
                          ),
                          child: DropdownButton<String>(
                            value: state.mealsPerDay.toString(),
                            icon: const Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 16,
                            style: TextStyle(
                                color:
                                    state.darkMode ? Colors.white : Colors.black),
                            underline: Container(height: 2, color: Colors.green),
                            onChanged: (String? newValue) {
                              setState(() {
                                state.mealsPerDay = int.parse(newValue!);
                              });
                            },
                            items: <String>['1', '2', '3', '4', '5']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value,
                                    style: TextStyle(
                                        color: state.darkMode
                                            ? Colors.white
                                            : Colors.black)),
                              );
                            }).toList(),
                          ),
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
                          style: TextStyle(
                              fontSize: 16,
                              color:
                                  state.darkMode ? Colors.white : Colors.black),
                        ),
                        Theme(
                          data: Theme.of(context).copyWith(
                            canvasColor: state.darkMode
                                ? Colors.black
                                : Colors.white,
                          ),
                          child: DropdownButton<String>(
                            value: state.numDaysPlanned.toString(),
                            icon: const Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 16,
                            style: TextStyle(
                                color:
                                    state.darkMode ? Colors.white : Colors.black),
                            underline: Container(height: 2, color: Colors.green),
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
