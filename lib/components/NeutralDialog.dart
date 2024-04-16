import 'package:boicott/models/product.dart';
import 'package:flutter/material.dart';
import "package:url_launcher/url_launcher.dart";

class NeutralDialog extends StatelessWidget {
  final Product product;
  const NeutralDialog({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      child: AlertDialog(
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.remove,
              color: Colors.black,
              size: 150,
            ),
            const Text(
              "This product is listed in the neutral list",
              style: TextStyle(color: Color.fromRGBO(44, 44, 44, 1)),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.network(
                width: 120,
                "https://boicott-api.motionu.club/images/neutral/${product.image}"),
            const SizedBox(
              height: 10,
            ),
            Text(
              product.name,
              style: const TextStyle(
                  fontSize: 15, color: Color.fromRGBO(44, 44, 44, 1)),
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
                          return Color.fromRGBO(44, 44, 44, 0.7);
                        return const Color.fromRGBO(44, 44, 4, 1);
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
