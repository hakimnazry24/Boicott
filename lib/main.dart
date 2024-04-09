import "package:boicott/pages/introduction_page/introduction_page.dart";
import "package:boicott/util/data_provider.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // fetch data from api endpoint

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DataProvider? dataProvider;

  @override
  void initState() {
    super.initState();
    dataProvider = DataProvider();
    dataProvider!.fetchAllData();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => dataProvider,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: IntroductionPage(),
          )),
    );
  }
}
