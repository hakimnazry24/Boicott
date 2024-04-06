import "package:boicott/pages/introduction_page/introduction_page.dart";
import "package:flutter/material.dart";
import "package:boicott/util/cache_data.dart";
import "package:boicott/util/consume_api.dart";

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // fetch data from api endpoint
  var retailers_data = await fetchAllRetailers();
  var products_data = await fetchAllProducts();
  var companies_data = await fetchAllCompanies();

  // cache data in SharedPreferences
  cacheData(retailers_data, "retailers");
  cacheData(products_data, "products");
  cacheData(companies_data, "companies");

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
