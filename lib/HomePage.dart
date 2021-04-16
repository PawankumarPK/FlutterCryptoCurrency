import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List currencies;
  final List<MaterialColor> _color = [Colors.red, Colors.blue, Colors.indigo];

  @override
  void initState() async {
    super.initState();
    currencies = await getCurrencies();
  }

  Future<List> getCurrencies() async {
    String cryptoUrl =
        "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=de6dd73f-7bff-40c2-bdfb-1175a65f7fae";
    http.Response response = await http.get(cryptoUrl);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Crypto Currency"),
      ),
      body: _cryptoWidget(),
    );
  }

  Widget _cryptoWidget() {
    return new Container(
        child: new Flexible(
            child: new ListView.builder(
      itemCount: currencies.length,
      itemBuilder: (BuildContext context, int index) {
        final Map currency = currencies[index];
        final MaterialColor color = _color[index % _color.length];
      },
    )));
  }
}
