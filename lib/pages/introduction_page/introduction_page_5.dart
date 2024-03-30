import 'package:flutter/material.dart';

class IntroductionPage5 extends StatelessWidget {
  const IntroductionPage5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(85, 124, 85, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("lib/images/introduction_page/blockchain.png"),
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Database are protected using blockchain technology",
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Our database is safeguarded by blockchain, ensuring secure and transparent storage of ethical information.",
            style: TextStyle(color: Colors.white, fontSize: 15, ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}