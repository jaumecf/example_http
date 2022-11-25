import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HTTP',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Exemple HTTP'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              //_peticioHttp();
              _peticioHttpJsonDecode();
            },
            child: Text('Fes petició HTTP'),
          ),
        ),
      ),
    );
  }
}

_peticioHttp() {
  // Podrem veure el valor també, fent el Debug
  final url = Uri.https('reqres.in', 'api/users?page=2');
  http.get(url).then((value) => print(value.body));
}

_peticioHttpJsonDecode() {
  // Podrem veure el valor també, fent el Debug
  // Error en declarar la Uri!!! (No donava error,
  // per que l'API te un unknown per defecte)
  //final url = Uri.https('reqres.in', 'api/users?page=2');
  // Declaració correcte
  final url = Uri.https('reqres.in', 'api/users', {'page': '2'});
  http.get(url).then((res) {
    final body = jsonDecode(res.body);
    //print(body);
    print('Page: ${body['page']}');
    print('Objecte en 3er lloc: ${body['data'][2]}');
    print('ID objecte en tercer lloc: ${body['data'][2]['id']}');
  });
}
