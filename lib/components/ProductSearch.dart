import 'package:boicott/components/BoycottDialog.dart';
import 'package:boicott/components/NeutralDialog.dart';
import 'package:boicott/components/SupportDialog.dart';
import 'package:boicott/models/product.dart';
import 'package:boicott/util/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductSearchDelegate extends SearchDelegate {
  List<Product> searchTerms;

  ProductSearchDelegate({required this.searchTerms});

  @override
  List<Widget>? buildActions(BuildContext context) {
    searchTerms = Provider.of<DataProvider>(context).products;
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Product> matchQuery = [];
    for (Product product in searchTerms) {
      if (product.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(product);
      }
    }

    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          Product result = matchQuery[index];
          return ListTile(
            title: Text(result.name),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Product> matchQuery = [];
    for (Product product in searchTerms) {
      if (product.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(product);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          Product result = matchQuery[index];
          return ListTile(
            title: Text(result.name),
            onTap: () {
              if (matchQuery[index].productStatus == 0) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(content: NeutralDialog(product: matchQuery[index]));
                    });
              }
              else if (matchQuery[index].productStatus == 1) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(content: SupportDialog(product: matchQuery[index]));
                    });
              }
              else if (matchQuery[index].productStatus == 2) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(content: BoycottDialog(product: matchQuery[index]));
                    });
              }
            },
          );
        });
  }
}
