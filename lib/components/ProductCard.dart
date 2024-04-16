import 'package:boicott/components/BoycottDialog.dart';
import 'package:boicott/models/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: BoycottDialog(
                product: product,
              ),
            );
          },
        );
      },
      child: SizedBox(
        width: 200,
        child: Card(
          child: Column(
            children: [
              Expanded(
                  child: product.productStatus == 0
                      ? Image.network(width: 120,
                          "https://boicott-api.motionu.club/images/neutral/${product.image}")
                      : product.productStatus == 1
                          ? Image.network(width: 120,
                              "https://boicott-api.motionu.club/images/support/${product.image}")
                          : product.productStatus == 2
                              ? Image.network(width: 120,
                                  "https://boicott-api.motionu.club/images/boycott/${product.image}")
                              : Center(
                                  child: Text("Product not found"),
                                )),
              const SizedBox(
                height: 10,
              ),
              Text(
                product.name,
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
