import 'package:boicott/models/retailer.dart';
import 'package:boicott/pages/list_page/list_page.dart';
import 'package:boicott/util/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RetailerListPage extends StatelessWidget {
  List<Retailer>? retailers;
  RetailerListPage({super.key});

  @override
  Widget build(BuildContext context) {
    retailers = Provider.of<DataProvider>(context).retailers;
    return ListView.builder(
        itemCount: retailers!.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ListPage(retailer: retailers![index],)));
            },
            child: Container(
              margin: EdgeInsets.all(30),
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
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        retailers![index].name,
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  Icon(Icons.forward),
                ],
              ),
            ),
          );
        });
  }
}
