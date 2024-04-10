import 'package:boicott/components/ProductCard.dart';
import 'package:boicott/models/product.dart';
import 'package:boicott/util/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BoycottListPage extends StatelessWidget {
  List<Product> boycottProducts = [];
  
  BoycottListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<DataProvider>(context).products;
    boycottProducts =
        products.where((product) => product.productStatus == 2).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Boycott products"),
      ),
      body: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
                textAlign: TextAlign.left,
                "Find boycott product based on Company name, Product name or bar code number."),
            const SizedBox(
              height: 10,
            ),
            const TextField(
              decoration: InputDecoration(
                  hintText: "Coca-cola company or Nestle",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)))),
            ),
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                children: List.generate(boycottProducts.length, (index) {
                  return ProductCard(product: boycottProducts[index]);
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
