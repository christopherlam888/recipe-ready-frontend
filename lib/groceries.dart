import 'package:flutter/material.dart';

class Groceries extends StatefulWidget {
  @override
  _GroceriesState createState() => _GroceriesState();
}

class _GroceriesState extends State<Groceries> {

  bool _isSelected = false;

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
                "Day 1 - Day 7",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              Expanded(
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index){
                    return Card(
                      elevation: 8.0,
                      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                      child: Container(
                        child: CheckboxListTile(
                          contentPadding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                          title: Text('Groceries'),
                          value: _isSelected,
                          secondary: Icon(Icons.image),
                          controlAffinity: ListTileControlAffinity.leading,
                          onChanged: (bool? value) {
                            setState(() {
                              _isSelected = value!;
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
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: Colors.pink,
          icon: Icon(
            Icons.clear,
            color: Colors.black,
          ),
          label: Text(
            "Reset All",
            style: TextStyle(
              color: Colors.black,
            ),
          )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
