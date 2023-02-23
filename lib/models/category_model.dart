// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'package:flutter/material.dart';

class ModelCategory {
  String name;
  String iconpath;
  Color boxColor;

  ModelCategory({
    required this.name,
    required this.iconpath,
    required this.boxColor,
  });

  static List<ModelCategory> getCategories() {
    List<ModelCategory> categories = [];

    categories.add(ModelCategory(
        name: 'Bengali Food',
        iconpath: 'images/bfood.jpg',
        boxColor: Color.fromARGB(255, 111, 211, 188)));

    categories.add(ModelCategory(
        name: 'Indian Food',
        iconpath: 'images/ifood.jpg',
        boxColor: Color.fromARGB(255, 50, 97, 184)));

    categories.add(ModelCategory(
        name: 'USA Food',
        iconpath: 'images/ufood.jpg',
        boxColor: Color.fromARGB(255, 169, 109, 32)));
    categories.add(ModelCategory(
        name: 'Japaness Food',
        iconpath: 'images/jfood.jpg',
        boxColor: Color.fromARGB(255, 81, 197, 98)));
    return categories;
  }
}
