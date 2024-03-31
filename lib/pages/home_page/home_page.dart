import 'package:boicott/components/ProductCard.dart';
import 'package:flutter/material.dart';
import "package:boicott/util/product_list.dart";

class HomePage extends StatelessWidget {
  final boycottProducts =
      products.where((product) => product.isBoycott).toList();

  final supportProducts =
      products.where((product) => !product.isBoycott).toList();
  
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
                hintText: "Search for product",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)))),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Boycott these products",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "More ->",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Container(
                  height: 200,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: boycottProducts.length,
                      itemBuilder: (context, index) {
                        return ProductCard(product: boycottProducts[index]);
                      }),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Support these products",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "More ->",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Container(
                  height: 200,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: supportProducts.length,
                      itemBuilder: (context, index) {
                        return ProductCard(product: supportProducts[index]);
                      }),
                ),
                SizedBox(
                  height: 60,
                ),
                Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Ask me anything",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            hintText:
                                "Suggest me products other than Coca-cola",
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)))),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
