import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:grouped_list/grouped_list.dart';

class Plan extends StatefulWidget {
  @override
  _PlanState createState() => _PlanState();
}

List _recipes = [
  {'name': 'Some Weird Salad', 'group': 'Day 1'},
  {'name': 'Spicy Chicken and Potato', 'group': 'Day 1'},
  {'name': 'The Best Noodles Ever', 'group': 'Day 2'},
  {'name': 'Some Weird Salad', 'group': 'Day 2'},
  {'name': 'Some Weird Salad', 'group': 'Day 3'},
  {'name': 'Some Weird Salad', 'group': 'Day 3'},
  {'name': 'Some Weird Salad', 'group': 'Day 4'},
  {'name': 'Some Weird Salad', 'group': 'Day 4'},
  {'name': 'Some Weird Salad', 'group': 'Day 5'},
  {'name': 'Some Weird Salad', 'group': 'Day 5'},
  {'name': 'Some Weird Salad', 'group': 'Day 6'},
  {'name': 'Some Weird Salad', 'group': 'Day 6'},
  {'name': 'Some Weird Salad', 'group': 'Day 7'},
  {'name': 'Some Weird Salad', 'group': 'Day 7'},
];

class _PlanState extends State<Plan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 25.0, 10.0, 75.0),
        child: GroupedListView<dynamic, String>(
          elements: _recipes,
          groupBy: (element) => element['group'],
          groupComparator: (value1, value2) => value2.compareTo(value1),
          itemComparator: (item1, item2) =>
              item1['name'].compareTo(item2['name']),
          order: GroupedListOrder.DESC,
          // useStickyGroupSeparators: true,
          groupSeparatorBuilder: (String value) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          itemBuilder: (c, element) {
            return Card(
              elevation: 8.0,
              margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              child: Container(
                child: ListTile(
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  leading: Icon(Icons.restaurant_menu),
                  title: Text(element['name']),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_red_eye),
                    onPressed: () {
                      Navigator.pushNamed(context, '/recipe');
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Colors.white,
        icon: Icon(
          Icons.add,
          color: Colors.black,
        ),
        label: Text(
          "Find Recipes",
          style: TextStyle(
            color: Colors.black,
          ),
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
