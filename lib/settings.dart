import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  bool _isVegetarian = false;
  bool _isVegan = false;
  bool _isTreeNutFree = false;
  bool _isPeanutFree = false;
  bool _isDairyFree = false;
  bool _isHalal = false;

  String yield = "1";
  int yieldInt = 1;
  String meals = "2";
  int mealsInt = 2;
  String days = "7";
  int daysInt = 7;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 75.0),
        child: Container(
          child: Column(
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
                value: _isVegetarian,
                onChanged: (bool value){
                  setState(() {
                    _isVegetarian = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text("Vegan"),
                activeColor: Colors.black,
                value: _isVegan,
                onChanged: (bool value){
                  setState(() {
                    _isVegan = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text("Tree Nut Free"),
                activeColor: Colors.black,
                value: _isTreeNutFree,
                onChanged: (bool value){
                  setState(() {
                    _isTreeNutFree = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text("Peanut Free"),
                activeColor: Colors.black,
                value: _isPeanutFree,
                onChanged: (bool value){
                  setState(() {
                    _isPeanutFree = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text("Dairy Free"),
                activeColor: Colors.black,
                value: _isDairyFree,
                onChanged: (bool value){
                  setState(() {
                    _isDairyFree = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text("Halal"),
                activeColor: Colors.black,
                value: _isHalal,
                onChanged: (bool value){
                  setState(() {
                    _isHalal = value;
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
                      value: yield,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.black),
                      underline: Container(
                        height: 2,
                        color: Colors.black
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          yield = newValue;
                          yieldInt = int.parse(newValue);
                        });
                      },
                      items: <String>['1', '2', '3', '4', '5', '6', '7', '8']
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
                      "Meals Per Day",
                      style: TextStyle(fontSize: 16),
                    ),
                    DropdownButton<String>(
                      value: meals,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.black),
                      underline: Container(
                          height: 2,
                          color: Colors.black
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          meals = newValue;
                          mealsInt = int.parse(newValue);
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
                      "Days To Plan",
                      style: TextStyle(fontSize: 16),
                    ),
                    DropdownButton<String>(
                      value: days,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.black),
                      underline: Container(
                          height: 2,
                          color: Colors.black
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          days = newValue;
                          daysInt = int.parse(newValue);
                        });
                      },
                      items: <String>['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14']
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
            ],
          ),
        ),
      ),
    );
  }
}
