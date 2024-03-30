import 'package:flutter/material.dart';

class IntroductionPage4 extends StatelessWidget {
  const IntroductionPage4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(85, 124, 85, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("lib/images/introduction_page/chatbot.png"),
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Chat with our Chatbot",
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Engage with our chatbot for quick assistance, tips, and answers to your ethical shopping queries.",
            style: TextStyle(color: Colors.white, fontSize: 15, ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}