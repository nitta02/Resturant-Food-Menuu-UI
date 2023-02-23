// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, non_constant_identifier_names, prefer_const_constructors_in_immutables, unused_element, file_names, prefer_interpolation_to_compose_strings, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:practice_food_app/models/diet_model.dart';
import 'package:practice_food_app/models/popular_model.dart';

import 'models/category_model.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ModelCategory> categories = [];
  List<DietPlan> dietplan = [];
  List<PopularDiet> popularDiet = [];

  void _getCategories() {
    categories = ModelCategory.getCategories();
  }

  void _getDietPlan() {
    dietplan = DietPlan.dietplan();
  }

  void _getInitialInfo() {
    categories = ModelCategory.getCategories();
    dietplan = DietPlan.dietplan();
    popularDiet = PopularDiet.getPolpularDiet();
  }

  @override
  Widget build(BuildContext context) {
    _getDietPlan();
    _getCategories();
    _getInitialInfo();
    return Scaffold(
      appBar: appBarfield(),
      body: ListView(children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _search_bar(),
          SizedBox(
            height: 30,
          ),
          _category(),
          SizedBox(
            height: 30,
          ),
          _planSection(),
          SizedBox(
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Popular Food Items",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      letterSpacing: 2.5,
                    ),
                  )),
              SizedBox(
                height: 15,
              ),
              ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    height: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12.withOpacity(0.09),
                              blurRadius: 40,
                              offset: Offset(0, 10))
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(150)),
                          child: Image.asset(
                            popularDiet[index].iconPath,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              popularDiet[index].name,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              popularDiet[index].duration +
                                  '||' +
                                  popularDiet[index].level,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                        GestureDetector(
                            onTap: () {},
                            child: Icon(Icons.arrow_back_ios_rounded)),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                  height: 25,
                ),
                itemCount: popularDiet.length,
                shrinkWrap: true,
              ),
              SizedBox(
                height: 20,
              ),
            ],
          )
        ]),
      ]),
    );
  }

  Column _planSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "Plan Section",
            style: TextStyle(
              fontSize: 20,
              letterSpacing: 1.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          padding: EdgeInsets.only(left: 10),
          height: 250,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: dietplan[index].boxcolor.withOpacity(0.5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          categories[index].iconpath))),
                            ),
                          )),
                      Text(
                        dietplan[index].name +
                            '||' +
                            dietplan[index].level +
                            '||' +
                            dietplan[index].Calorie +
                            '||' +
                            dietplan[index].duration,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.5,
                        ),
                      ),
                      Container(
                        height: 45,
                        width: 150,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              dietplan[index].viewIsSelected
                                  ? Color(0xff9DCEFF)
                                  : Colors.transparent,
                              dietplan[index].viewIsSelected
                                  ? Color(0xff92A3FD)
                                  : Colors.transparent,
                            ]),
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                            child: Text(
                          'View',
                          style: TextStyle(
                            fontSize: 15,
                            color: dietplan[index].viewIsSelected
                                ? Colors.white
                                : Color(0xffC58BF2),
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                    width: 25,
                  ),
              itemCount: dietplan.length),
        )
      ],
    );
  }

  Column _category() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "Category",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 150,
          child: Padding(
            padding: EdgeInsets.only(left: 10),
            child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                      width: 15,
                    ),
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 150,
                    decoration: BoxDecoration(
                      color: categories[index].boxColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          categories[index].iconpath))),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          categories[index].name,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2.5,
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ),
        )
      ],
    );
  }

  Column _search_bar() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(18),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: Icon(Icons.search),
              hintText: "Search",
              hintStyle: TextStyle(
                fontSize: 15,
                letterSpacing: 2.5,
              ),
              suffixIcon: Container(
                width: 100,
                child: IntrinsicHeight(
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    VerticalDivider(
                      indent: 10.00,
                      endIndent: 10.00,
                      color: Colors.black,
                      thickness: 0.3,
                    ),
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.wrap_text_outlined)),
                  ]),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  AppBar appBarfield() {
    return AppBar(
      automaticallyImplyLeading: false,
      // ignore: prefer_const_literals_to_create_immutables
      title: Text(
        "Food Home",
        style: TextStyle(
          fontSize: 20,
          letterSpacing: 2.5,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.amberAccent,
      leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.more)),
      ],
    );
  }
}
