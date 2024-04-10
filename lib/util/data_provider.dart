import 'dart:convert';

import 'package:boicott/models/company.dart';
import 'package:boicott/models/product.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

class DataProvider extends ChangeNotifier {
  List<Product> products = [];
  List<Company> companies = [];

  Future<void> fetchAllData() async {
    Uri productsUri = Uri.parse("https://boicott-api.motionu.club/products");
    Uri companiesUri = Uri.parse("https://boicott-api.motionu.club/companies");

    var productsResponse = await http.get(productsUri);
    var companiesResponse = await http.get(companiesUri);

    List productsJson = jsonDecode(productsResponse.body);
    List companiesJson = jsonDecode(companiesResponse.body);

    products = productsJson.map((e) => Product.fromJson(e)).toList();
    companies = companiesJson.map((e) => Company.fromJson(e)).toList();

    notifyListeners();
  }
}
