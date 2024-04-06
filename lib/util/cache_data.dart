import 'package:shared_preferences/shared_preferences.dart';

Future<void> cacheData(var data, String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, data);
}

Future<dynamic> readCachedData(String key) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = prefs.getString(key);
    return data;
  } catch (err) {
    print("Error reading cached data $key. $err");
  }
}
