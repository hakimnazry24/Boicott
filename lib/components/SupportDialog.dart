import 'package:boicott/models/product.dart';
import 'package:flutter/material.dart';
import "package:url_launcher/url_launcher.dart";

class SupportDialog extends StatelessWidget {
  final Product product;
  const SupportDialog({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      child: AlertDialog(
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle,
              color: Color.fromRGBO(85, 124, 85, 1),
              size: 150,
            ),
            const Text(
              "This product is listed in the support list",
              style: TextStyle(color: Color.fromRGBO(85, 124, 85, 0.9)),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.network(
                width: 120,
                "https://boicott-api.motionu.club/images/supportccccc/${product.image}"),
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
                        if (states.contains(MaterialState.pressed))
                          return Colors.red;
                        return const Color.fromRGBO(85, 124, 85, 1);
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
