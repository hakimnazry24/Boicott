import 'package:boicott/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
