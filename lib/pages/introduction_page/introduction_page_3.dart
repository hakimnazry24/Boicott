import 'package:flutter/material.dart';

class IntroductionPage3 extends StatelessWidget {
  const IntroductionPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(85, 124, 85, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("lib/images/introduction_page/add.png"),
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Add new-finding products",
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Easily contribute new findings, expanding our database for informed, ethical consumer decisions. Join us now!",
            style: TextStyle(color: Colors.white, fontSize: 15, ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
