import 'package:flutter/material.dart';

class IntroductionPage1 extends StatelessWidget {
  const IntroductionPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(85, 124, 85, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("lib/images/introduction_page/scan.png"),
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Scan for product bar code",
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Scan barcodes effortlessly to unveil product origins, ethics, and sustainability. Make informed, ethical choices.",
            style: TextStyle(color: Colors.white, fontSize: 15, ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
