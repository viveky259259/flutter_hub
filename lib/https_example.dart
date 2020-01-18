import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpExample extends StatefulWidget {
  @override
  _HttpExampleState createState() => _HttpExampleState();
}

class _HttpExampleState extends State<HttpExample> {
  bool data = false;
  String result;

  getData() async {
    var result = await http.get("http://numbersapi.com/26");
//    print(json.decode(result.body));
    print(result.body);
    this.result = result.body;
    data = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Mumbai: HTTP"),
      ),
      body: Center(
          child: data
              ? Text(
                  " $result ",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                )
              : Text(
                  "Aaj mai internet chalayega",
                  style: TextStyle(fontSize: 64),
                )),
    );
  }
}
