import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final Function(int) onItemTapped;
  final int currentIndex;

  const BottomNavBar(
      {super.key, required this.onItemTapped, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (index) => onItemTapped(index),
      showUnselectedLabels: true,
      selectedItemColor: const Color.fromRGBO(250, 112, 112, 1),
      currentIndex: currentIndex,
      backgroundColor: const Color.fromRGBO(85, 124, 85, 1),
      items: [
        const BottomNavigationBarItem(
            icon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Icon(Icons.home)),
            label: "Home"),
        const BottomNavigationBarItem(
            icon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Icon(Icons.list)),
            label: "List"),
        BottomNavigationBarItem(
            icon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(15, 6, 15, 6),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(250, 112, 112, 1),
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(
                    Icons.qr_code_scanner,
                  ),
                )),
            label: "Scan"),
        const BottomNavigationBarItem(
            icon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Icon(Icons.chat)),
            label: "Chat"),
        const BottomNavigationBarItem(
            icon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Icon(Icons.info)),
            label: "About"),
      ],
    );
  }
}
