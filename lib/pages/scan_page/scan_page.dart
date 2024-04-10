import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:boicott/components/BoycottDialog.dart';
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
  List productAndProductStatus = [];
  List<Product> supportProduct = [];
  List<Product> boycottProduct = [];
  List<Product> neutralProduct = [];

  @override
  void initState() {
    super.initState();
    supportProduct =
        Provider.of<DataProvider>(context, listen: false).supportProducts;
    boycottProduct =
        Provider.of<DataProvider>(context, listen: false).boycottProducts;
    neutralProduct =
        Provider.of<DataProvider>(context, listen: false).neutralProducts;
  }

  List findProductBasedOnSerialNumber(String scanResult) {
    int serialNumber = scanResult as int;

    for (Product product in boycottProduct) {
      if (product.serialNumber == serialNumber) {
        return [product, 2];
      }
    }

    for (Product product in supportProduct) {
      if (product.serialNumber == serialNumber) {
        return [product, 1];
      }
    }
    for (Product product in neutralProduct) {
      if (product.serialNumber == serialNumber) {
        return [product, 0];
      }
    }

    // return [-1] if no product is found
    return [-1];
  }

  @override
  Widget build(BuildContext context) {
    return AiBarcodeScanner(
      onScan: (String value) {
        setState(() {
          scanResult = value;
          productAndProductStatus = findProductBasedOnSerialNumber(scanResult);
        });

        showDialog(
            context: context,
            builder: (BuildContext context) {
              if (productAndProductStatus[1] == 2) {
                return BoycottDialog(product: productAndProductStatus[0]);
              } else if (productAndProductStatus[1] == 1) {
                return SupportDialog(product: productAndProductStatus[0]);
              } else if (productAndProductStatus[1] == 1) {
                return AlertDialog(
                  content: Text("Neutral product"),
                );
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
