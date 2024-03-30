import "package:boicott/pages/introduction_page/introduction_page.dart";
import "package:flutter/material.dart";

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: IntroductionPage(),
        ));
  }
}
