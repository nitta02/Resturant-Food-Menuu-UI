class PopularDiet {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  bool boxIsSelected;

  PopularDiet(
      {required this.name,
      required this.iconPath,
      required this.level,
      required this.duration,
      required this.calorie,
      required this.boxIsSelected});

  static List<PopularDiet> getPolpularDiet() {
    List<PopularDiet> popularDiet = [];

    popularDiet.add(PopularDiet(
        name: "Rice",
        iconPath: 'images/bfood.jpg',
        level: "High",
        duration: '3 Hour',
        calorie: '500 cal',
        boxIsSelected: true));

    popularDiet.add(PopularDiet(
        name: "Chaominse",
        iconPath: 'images/jfood.jpg',
        level: "High",
        duration: '2 Hour',
        calorie: '200 cal',
        boxIsSelected: true));

    popularDiet.add(PopularDiet(
        name: "USA Food",
        iconPath: 'images/ufood.jpg',
        level: "High",
        duration: '1 Hour',
        calorie: '1500 cal',
        boxIsSelected: true));
    return popularDiet;
  }
}
