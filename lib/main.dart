import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  List currencies = await getCurrencies();
  print(currencies);
  runApp(new myApp(currencies));
}

class myApp extends StatelessWidget {
  final List _curriences;

  myApp(this._curriences)


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
  return json.decode(response.body);
}
