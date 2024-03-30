import 'package:boicott/pages/home_page/home_page.dart';
import 'package:boicott/pages/introduction_page/introduction_page_1.dart';
import 'package:boicott/pages/introduction_page/introduction_page_2.dart';
import 'package:boicott/pages/introduction_page/introduction_page_3.dart';
import 'package:boicott/pages/introduction_page/introduction_page_4.dart';
import 'package:boicott/pages/introduction_page/introduction_page_5.dart';
import 'package:flutter/material.dart';
import "package:smooth_page_indicator/smooth_page_indicator.dart";

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({super.key});

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  final controller = PageController();
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        currentPage = controller.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView(
            controller: controller,
            children: <Widget>[
              IntroductionPage1(),
              IntroductionPage2(),
              IntroductionPage3(),
              IntroductionPage4(),
              IntroductionPage5(),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: SmoothPageIndicator(
                  controller: controller,
                  count: 5,
                  effect: ColorTransitionEffect(activeDotColor: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: currentPage == 4
          ? FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            }, child: Icon(Icons.forward),)
          : null,
          
    );
  }
}
