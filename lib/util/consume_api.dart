import "dart:convert";
import "dart:typed_data";
import "package:http/http.dart" as http;
import "package:path/path.dart" as path;

Future<dynamic> fetchAllProducts() async {
  Uri uri = Uri.parse("https://boicott-api.motionu.club/products");
  var jsonData;

  try {
    final response = await http.get(uri);
    jsonData = jsonDecode(response.body);
  } catch (err) {
    print("Failed fetching data Products. Caught error: $err");
  }

  return jsonData;
}

Future<dynamic> fetchAllRetailers() async {
  Uri uri = Uri.parse("https://boicott-api.motionu.club/retailers");
  var jsonData;

  try {
    final response = await http.get(uri);
    jsonData = jsonDecode(response.body);
  } catch (err) {
    print("Failed fetching data Retailers. Caught error: $err");
  }

  return jsonData;
}

Future<dynamic> fetchAllCompanies() async {
  Uri uri = Uri.parse("https://boicott-api.motionu.club/companies");
  var jsonData;

  try {
    final response = await http.get(uri);
    jsonData = jsonDecode(response.body);
  } catch (err) {
    print("Failed fethcing data Companies. Caught error: $err");
  }

  return jsonData;
}

Future<Uint8List?> fetchImage(String image) async {
  String endpoint =
      path.join("https://boicott-api.motionu.club/companies", "images", image);
  Uri uri = Uri.parse(endpoint);
  Uint8List? imageData;

  try {
    final response = await http.get(uri);
    imageData = response.bodyBytes;
  } catch (err) {
    print("Failed fetching image $image. Caught error $err");
  }

  return imageData;
}
