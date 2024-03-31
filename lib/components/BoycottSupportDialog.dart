import 'package:boicott/models/product.dart';
import 'package:flutter/material.dart';
import "package:url_launcher/url_launcher.dart";

class BoycottSupportDialog extends StatelessWidget {
  final Product product;
  const BoycottSupportDialog({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      child: AlertDialog(
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            product.isBoycott
                ? const Icon(
                    Icons.cancel,
                    color: Colors.red,
                    size: 150,
                  )
                : const Icon(
                    Icons.check_circle,
                    color: Color.fromRGBO(85, 124, 85, 1),
                    size: 150,
                  ),
            product.isBoycott
                ? const Text(
                    "This product is listed in the boycott list",
                    style: TextStyle(color: Color.fromRGBO(255, 64, 64, 1)),
                  )
                : const Text(
                    "This product is listed in the support list",
                    style: TextStyle(color: Color.fromRGBO(85, 124, 85, 0.9)),
                  ),
            const SizedBox(
              height: 20,
            ),
            Image.asset(product.image, width: 200),
            const SizedBox(
              height: 10,
            ),
            Text(
              product.name,
              style: const TextStyle(fontSize: 15, color: Colors.black45),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed) ||
                            product.isBoycott) return Colors.red;
                        return product.isBoycott
                            ? const Color.fromRGBO(85, 124, 85, 1)
                            : const Color.fromRGBO(85, 124, 85, 1);
                      },
                    ),
                  ),
                  onPressed: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Proof",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.open_in_new,
                        color: Colors.white,
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
