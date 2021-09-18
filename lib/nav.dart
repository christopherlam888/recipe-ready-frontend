import 'package:flutter/material.dart';
import 'package:recipe_ready/plan.dart';
import 'package:recipe_ready/today.dart';
import 'package:recipe_ready/groceries.dart';
import 'package:recipe_ready/settings.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {

  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    Plan(),
    Today(),
    Groceries(),
    Settings(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.date_range),
            label: 'Plan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Today',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Groceries',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTap,
      ),
    );
  }
}
