import 'dart:convert';
import 'package:http/http.dart';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    var uri = Uri.parse(url);
    Response response = await get(uri);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    }
    else {
      print(response.statusCode);
    }
  }
}