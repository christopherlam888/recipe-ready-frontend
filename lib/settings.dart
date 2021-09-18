import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

bool _isSet = false;

class _SettingsState extends State<Settings> {
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
                value: _isSet,
                onChanged: (bool value){
                  setState(() {
                    _isSet = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text("Vegan"),
                activeColor: Colors.black,
                value: _isSet,
                onChanged: (bool value){
                  setState(() {
                    _isSet = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text("Tree Nut Free"),
                activeColor: Colors.black,
                value: _isSet,
                onChanged: (bool value){
                  setState(() {
                    _isSet = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text("Peanut Free"),
                activeColor: Colors.black,
                value: _isSet,
                onChanged: (bool value){
                  setState(() {
                    _isSet = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text("Dairy Free"),
                activeColor: Colors.black,
                value: _isSet,
                onChanged: (bool value){
                  setState(() {
                    _isSet = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text("Halal"),
                activeColor: Colors.black,
                value: _isSet,
                onChanged: (bool value){
                  setState(() {
                    _isSet = value;
                  });
                },
              ),
              Text(
                "Meals",
                style: TextStyle(fontSize: 20),
              ),
              SwitchListTile(
                title: Text("Test"),
                activeColor: Colors.black,
                value: _isSet,
                onChanged: (bool value){
                  setState(() {
                    _isSet = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
