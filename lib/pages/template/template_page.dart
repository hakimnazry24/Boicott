import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:boicott/components/BottomNavBar.dart';
import 'package:boicott/components/ProductSearch.dart';
import 'package:boicott/models/product.dart';
import 'package:boicott/pages/about_page/about_page.dart';
import 'package:boicott/pages/chat_page/chat_page.dart';
import 'package:boicott/pages/home_page/home_page.dart';
import 'package:boicott/pages/list_page/list_page.dart';
import 'package:boicott/pages/retailer_list_page/retailer_list_page.dart';
import 'package:boicott/pages/scan_page/scan_page.dart';
import 'package:boicott/util/data_provider.dart';
import 'package:flutter/material.dart';
import "package:boicott/util/product_list.dart";
import 'package:provider/provider.dart';

/* 
  TemplatePage contains BottomNavBar that persists in HomePage, ListPage, ScanPage, 
  ChatPage, and AboutPage

  The only changing part in TemplatePage is the body

 */
class TemplatePage extends StatefulWidget {
  const TemplatePage({super.key});

  @override
  State<TemplatePage> createState() => _TemplatePageState();
}

class _TemplatePageState extends State<TemplatePage> {
  int currentIndex = 0;
  String barCodeResult = "";
  List<Widget> pages = [];

  void changeBarCodeResult(String _barCodeResult) {
    setState(() {
      barCodeResult = _barCodeResult;
    });
  }

  void onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });

    // if (index == 2) {
    //   scanBarCode();
    //   setState(() {
    //     currentIndex = 0; // redirect back to home page after scanning or if cancel scanning
    //   });
    // }
  }

  // Future<void> scanBarCode() async {
  //   String result = "";
  //   try {
  //     var scanResult = await BarcodeScanner.scan();
  //     result = scanResult.rawContent;
  //     setState(() {
  //       barCodeResult = result;
  //       print("\n\n\n\n\n\n\n\n\n$result");
  //     });
  //   } catch (e) {
  //     result = "Error $e";
  //     print("\n\n\n\n\n\n\n\n\n$result");
  //   }
  // }

  @override
  void initState() {
    super.initState();
    pages = [
      HomePage(),
      RetailerListPage(),
      const ScanPage(),
      const ChatPage(),
      const AboutPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    List<Product> products = Provider.of<DataProvider>(context).products;
    return Scaffold(
      appBar: AppBar(
        title: Text(barCodeResult),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: ProductSearchDelegate(searchTerms: products));
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: pages[currentIndex],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(canvasColor: const Color.fromRGBO(85, 124, 85, 1)),
        child: BottomNavBar(
          onItemTapped: onItemTapped,
          currentIndex: currentIndex,
        ),
      ),
    );
  }
}
