import 'dart:convert';

import 'package:boicott/models/company.dart';
import 'package:boicott/models/product.dart';
import 'package:boicott/models/retailer.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

class DataProvider extends ChangeNotifier {
  List<Product> products = [];
  List<Company> companies = [];
  List<Retailer> retailers = [];

  Future<void> fetchAllData() async {
    Uri productsUri = Uri.parse("https://boicott-api.motionu.club/products");
    Uri companiesUri = Uri.parse("https://boicott-api.motionu.club/companies");
    Uri retailersUri = Uri.parse("https://boicott-api.motionu.club/retailers");

    var productsResponse = await http.get(productsUri);
    var companiesResponse = await http.get(companiesUri);
    var retailersResponse = await http.get(retailersUri);

    List productsJson = jsonDecode(productsResponse.body);
    List companiesJson = jsonDecode(companiesResponse.body);
    List retailersJson = jsonDecode(retailersResponse.body);

    products = productsJson.map((e) => Product.fromJson(e)).toList();
    companies = companiesJson.map((e) => Company.fromJson(e)).toList();
    retailers = retailersJson.map((e) => Retailer.fromJson(e)).toList();

    notifyListeners();
  }
}
