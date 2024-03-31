import 'package:boicott/components/BoycottSupportDialog.dart';
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
              content: BoycottSupportDialog(product: product,),
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
                  child: Image.asset(
                product.image,
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
