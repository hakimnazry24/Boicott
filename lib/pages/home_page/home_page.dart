import 'package:boicott/components/ProductCard.dart';
import 'package:boicott/models/product.dart';
import 'package:boicott/util/data_provider.dart';
import 'package:flutter/material.dart';
import "package:boicott/util/product_list.dart";
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> products = [];
  List<Product> boycottProducts = [];
  List<Product> supportProducts = [];
  final TextEditingController _filter = TextEditingController();
  List<Product> _filteredProducts = [];

  @override
  void initState() {
    super.initState();
    _filter.addListener(_searchListener);
  }

  void _searchListener() {
    setState(() {
      _filteredProducts = products
          .where((product) =>
              product.name.toLowerCase().contains(_filter.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    products = Provider.of<DataProvider>(context).products;
    boycottProducts = products.where((product) => product.productStatus == 2).toList();
    supportProducts = products.where((product) => product.productStatus == 1).toList();

    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: Column(
        children: [
          // TextField(
          //   controller: _filter,
          //   decoration: InputDecoration(
          //       hintText: "Search for product",
          //       prefixIcon: Icon(Icons.search),
          //       border: OutlineInputBorder(
          //           borderRadius: BorderRadius.all(Radius.circular(25)))),
          // ),
          // SizedBox(
          //   height: 15,
          // ),
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
