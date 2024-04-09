import 'dart:convert';

import 'package:boicott/models/company.dart';
import 'package:boicott/models/product.dart';
import 'package:boicott/models/retailer.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

class DataProvider extends ChangeNotifier {
  List<Product> supportProducts = [];
  List<Product> boycottProducts = [];
  List<Product> neutralProducts = [];
  List<Company> supportCompanies = [];
  List<Company> boycottCompanies = [];
  List<Company> neutralCompanies = [];

  Future<void> fetchAllData() async {
    Uri supportProductsUri =
        Uri.parse("https://boicott-api.motionu.club/support-products");
    Uri boycottProductsUri =
        Uri.parse("https://boicott-api.motionu.club/boycott-products");
    Uri neutralProductsUri =
        Uri.parse("https://boicott-api.motionu.club/neutral-products");
    Uri supportCompaniesUri =
        Uri.parse("https://boicott-api.motionu.club/support-companies");
    Uri boycottCompaniesUri =
        Uri.parse("https://boicott-api.motionu.club/boycott-companies");
    Uri neutralCompaniesUri =
        Uri.parse("https://boicott-api.motionu.club/neutral-companies");

    var supportProductsResponse = await http.get(supportProductsUri);
    var boycottProductsResponse = await http.get(boycottProductsUri);
    var neutralProductsResponse = await http.get(neutralProductsUri);
    var supportCompaniesResponse = await http.get(supportCompaniesUri);
    var boycottCompaniesResponse = await http.get(boycottCompaniesUri);
    var neutralCompaniesResponse = await http.get(neutralCompaniesUri);

    List supportProductsJson = jsonDecode(supportProductsResponse.body);
    List boycottProductsJson = jsonDecode(boycottProductsResponse.body);
    List neutralProductsJson = jsonDecode(neutralProductsResponse.body);
    List supportCompaniesJson = jsonDecode(supportCompaniesResponse.body);
    List boycottCompaniesJson = jsonDecode(boycottCompaniesResponse.body);
    List neutralCompaniesJson = jsonDecode(neutralCompaniesResponse.body);

    supportProducts =
        supportProductsJson.map((e) => Product.fromJson(e)).toList();
    boycottProducts =
        boycottProductsJson.map((e) => Product.fromJson(e)).toList();
    neutralProducts =
        neutralProductsJson.map((e) => Product.fromJson(e)).toList();

    supportCompanies =
        supportCompaniesJson.map((e) => Company.fromJson(e)).toList();
    boycottCompanies =
        boycottCompaniesJson.map((e) => Company.fromJson(e)).toList();
    neutralCompanies =
        neutralCompaniesJson.map((e) => Company.fromJson(e)).toList();


    notifyListeners();
  }
}
