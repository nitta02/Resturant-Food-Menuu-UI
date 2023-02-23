// ignore_for_file: unused_import, non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';

class DietPlan {
  String name;
  String iconpath;
  String level;
  bool viewIsSelected;
  String Calorie;
  String duration;
  Color boxcolor;

  DietPlan(
      {required this.Calorie,
      required this.duration,
      required this.iconpath,
      required this.level,
      required this.name,
      required this.boxcolor,
      required this.viewIsSelected});

  static List<DietPlan> dietplan() {
    List<DietPlan> dietplan = [];

    dietplan.add(DietPlan(
        Calorie: "200k Cal",
        duration: "1 Hour",
        iconpath: "images/bfood.jpg",
        level: "Easy",
        name: "Bengali Food Items",
        boxcolor: Color.fromARGB(255, 111, 211, 188),
        viewIsSelected: true));

    dietplan.add(DietPlan(
        Calorie: "200k Cal",
        duration: "1.5 Hours ",
        iconpath: "images/ifood.jpg",
        level: "Easy",
        name: "Indian Food Items",
        boxcolor: Color.fromARGB(255, 55, 99, 89),
        viewIsSelected: true));

    dietplan.add(DietPlan(
        Calorie: "200k Cal",
        duration: "2 Hours",
        iconpath: "images/ufood.jpg",
        level: "Easy",
        name: "U.S.A. Food Items",
        boxcolor: Color.fromARGB(255, 22, 59, 117),
        viewIsSelected: true));
    dietplan.add(DietPlan(
        Calorie: "200k Cal",
        duration: "2 Hours",
        iconpath: "images/jfood.jpg",
        level: "Easy",
        name: "Japaness Food Items",
        boxcolor: Color.fromARGB(255, 22, 59, 117),
        viewIsSelected: true));
    return dietplan;
  }
}
