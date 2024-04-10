import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:boicott/components/BoycottDialog.dart';
import 'package:boicott/components/NeutralDialog.dart';
import 'package:boicott/components/SupportDialog.dart';
import 'package:boicott/models/product.dart';
import 'package:boicott/util/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  String scanResult = "";
  Product? product;
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    products = Provider.of<DataProvider>(context, listen: false).products;
  }

  Product? findProductBasedOnSerialNumber(String scanResult) {
    int serialNumber = scanResult as int;

    for (Product product in products) {
      if (product.serialNumber == serialNumber) {
        return product;
      }
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return AiBarcodeScanner(
      onScan: (String value) {
        setState(() {
          scanResult = value;
          product = findProductBasedOnSerialNumber(scanResult);
        });

        showDialog(
            context: context,
            builder: (BuildContext context) {
              if (product!.productStatus == 2) {
                return BoycottDialog(product: product!);
              } else if (product!.productStatus == 1) {
                return SupportDialog(product: product!);
              } else if (product!.productStatus == 1) {
                return NeutralDialog(product: product!);
              } else {
                return AlertDialog(
                  content: Text("Product not found"),
                );
              }
            });
      },
    );
  }
}
