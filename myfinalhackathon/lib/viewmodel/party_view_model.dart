import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class PartyViewModel extends BaseViewModel {
  final PageController pageController = PageController();

  List<Map<String, String>> get pizzas => [
        {'name': 'Pepperoni', 'image': 'assets/images/pepperoni.pn'},
        {'name': 'Chicken', 'image': 'assets/images/chickens.png'},
        {'name': 'Farmhouse', 'image': 'assets/images/framhouse.png'},
        {'name': 'Tomato', 'image': 'assets/images/tomato.png'},
        {'name': 'Strawberry', 'image': 'assets/images/strawberry.png'},
      ];

  double getRotationAngle(int index, double scrollPosition) {
    final double itemPosition = index - scrollPosition;
    return itemPosition * 0.2;
  }
}
