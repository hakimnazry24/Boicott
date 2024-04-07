import 'package:flutter/material.dart';

class IntroductionPage2 extends StatelessWidget {
  const IntroductionPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(85, 124, 85, 1),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("lib/images/introduction_page/list.png"),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Find list of boycott and support products",
              style: TextStyle(
                  color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Discover lists: boycott unethical products, support ethical ones. Empower your choices for a better world.",
              style: TextStyle(color: Colors.white, fontSize: 15, ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
