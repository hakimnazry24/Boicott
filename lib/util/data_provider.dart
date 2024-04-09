import 'dart:convert';

import 'package:boicott/models/company.dart';
import 'package:boicott/models/retailer.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

class DataProvider extends ChangeNotifier {
  List<Company> supportCompanies = [];
  List<Company> boycottCompanies = [];
  List<Company> neutralCompanies = [];

  Future<void> fetchAllData() async {
    print("hellow");
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
    print(boycottCompaniesResponse.body);
    print("anoter hello owrld");
    List supportProductsJson = jsonDecode(supportProductsResponse.body);
    List boycottProductsJson = jsonDecode(boycottProductsResponse.body);
    List neutralProductsJson = jsonDecode(neutralProductsResponse.body);
    List supportCompaniesJson = jsonDecode(supportCompaniesResponse.body);
    List boycottCompaniesJson = jsonDecode(boycottCompaniesResponse.body);
    List neutralCompaniesJson = jsonDecode(neutralCompaniesResponse.body);

    print("anoht ae");
    // List<Product> supportProduct = supportProductsJson.map((e) => )

    supportCompanies =
        supportCompaniesJson.map((e) => Company.fromJson(e)).toList();
    print("setstate");
    boycottCompanies =
        boycottCompaniesJson.map((e) => Company.fromJson(e)).toList();
    print("inside");
    neutralCompanies =
        neutralCompaniesJson.map((e) => Company.fromJson(e)).toList();

    print(boycottCompanies![0].name);

    print("below set state");
    notifyListeners();
  }
}
