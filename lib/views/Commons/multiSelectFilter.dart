
import 'package:flutter/material.dart';
import 'package:food_delivery/Models/Food.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class MultiSelectFilter extends StatefulWidget {
  MultiSelectFilter({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MultiSelectFilter> {
  static List<Food> _animals = [
    Food(id: 1, name: "Salad"),
    Food(id: 2, name: "Pizza"),
    Food(id: 3, name: "Beverages"),
    Food(id: 4, name: "Desserts"),
    Food(id: 5, name: "Snacks"),
    Food(id: 6, name: "Noodles"),
    Food(id: 7, name: "Rolls"),
    Food(id: 8, name: "Paneer"),
    Food(id: 9, name: "Dosas"),
    Food(id: 10, name: "tea"),
  ];
  final _items = _animals
      .map((animal) => MultiSelectItem<Food>(animal, animal.name))
      .toList();

  List<Food> _selectedAnimals4 = [];

  @override
  Widget build(BuildContext context) {
    return
       Container(
         width: double.infinity,
         child: MultiSelectChipField(
           items: _items,
           initialValue: [_animals[4], _animals[7], _animals[9]],
           showHeader: false,
           decoration: BoxDecoration(
             border: Border.all(color: Colors.transparent, width: 1.8),
           ),
           selectedChipColor: Colors.grey.withOpacity(0.5),
           selectedTextStyle: TextStyle(color: Colors.black),
           onTap: (values) {
             _selectedAnimals4 = values;
           },
         ),
       );
  }
}