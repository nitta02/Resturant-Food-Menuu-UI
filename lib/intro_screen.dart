// ignore_for_file: prefer_const_constructors, prefer_final_fields, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:practice_food_app/Homepage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  PageController _controller = PageController();

  //Track if we are on the last page or not
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return intro_screen(context);
  }

  Scaffold intro_screen(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 2);
            });
          },
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/im1.jpg'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black12.withOpacity(0.5), BlendMode.darken))),
            ),
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/im2.jpg'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black12.withOpacity(0.5), BlendMode.darken))),
            ),
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/im3.jpg'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black12.withOpacity(0.5), BlendMode.darken))),
            )
          ],
        ),
        Container(
            alignment: Alignment(0, 0.75),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(2);
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 2.5,
                      ),
                    ),
                  ),
                  SmoothPageIndicator(controller: _controller, count: 3),
                  onLastPage
                      ? GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                          child: Text(
                            "Done",
                            style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 2.5,
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            _controller.nextPage(
                              duration: Duration(seconds: 2),
                              curve: Curves.easeIn,
                            );
                          },
                          child: Text(
                            "Next",
                            style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 2.5,
                            ),
                          ),
                        )
                ]))
      ]),
    );
  }
}
