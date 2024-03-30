import 'package:boicott/pages/list_page/boycott_list_page.dart';
import 'package:boicott/pages/list_page/support_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(40),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BoycottListPage()));
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    )
                  ]),
              padding: EdgeInsets.fromLTRB(50, 30, 50, 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.cancel,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Boycott products",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  Icon(Icons.forward),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SupportListPage()));
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    )
                  ]),
              padding: EdgeInsets.fromLTRB(50, 30, 50, 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.check_box,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Support products",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  Icon(Icons.forward),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
