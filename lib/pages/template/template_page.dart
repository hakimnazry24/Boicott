import 'package:boicott/components/BottomNavBar.dart';
import 'package:boicott/pages/about_page/about_page.dart';
import 'package:boicott/pages/chat_page/chat_page.dart';
import 'package:boicott/pages/home_page/home_page.dart';
import 'package:boicott/pages/list_page/list_page.dart';
import 'package:boicott/pages/scan_page/scan_page.dart';
import 'package:flutter/material.dart';
import "package:boicott/util/product_list.dart";

class TemplatePage extends StatefulWidget {
  const TemplatePage({super.key});

  @override
  State<TemplatePage> createState() => _TemplatePageState();
}

class _TemplatePageState extends State<TemplatePage> {
  int currentIndex = 0;
  List<Widget> pages = [
    HomePage(),
    const ListPage(),
    const ScanPage(),
    const ChatPage(),
    const AboutPage(),
  ];
  final boycottProducts =
      products.where((product) => product.isBoycott).toList();

  final supportProducts =
      products.where((product) => !product.isBoycott).toList();

  void onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
