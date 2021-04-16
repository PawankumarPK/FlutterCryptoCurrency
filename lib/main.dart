import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  List currencies = await getCurrencies();
  print(currencies);
  runApp(new MyApp(currencies));
}

class MyApp extends StatelessWidget {
  final List _curriences;
  MyApp(this._curriences);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(primarySwatch: Colors.pink),
      home: HomePage(_curriences),
    );
  }
}

Future<List> getCurrencies() async {
  String cryptoUrl =
      "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=de6dd73f-7bff-40c2-bdfb-1175a65f7fae";
  http.Response response = await http.get(cryptoUrl);
  Map<String, dynamic> map = json.decode(response.body);
  List<dynamic> data = map["data"];
  return data;
}
