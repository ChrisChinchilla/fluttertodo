import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppState with ChangeNotifier {
  String _dataUrl = env['TRELLO_URL'];

  AppState();
  String _jsonResponse = "";
  bool _isFetching = false;
  bool get isFetching => _isFetching;

  Future<void> fetchData() async {
    _isFetching = true;
    notifyListeners();

    var response = await http.get(_dataUrl);
    if (response.statusCode == 200) {
      _jsonResponse = response.body;
    }

    _isFetching = false;
    notifyListeners();
  }

  List<dynamic> getResponseJson() {
    if (_jsonResponse.isNotEmpty) {
      List<dynamic> json = jsonDecode(_jsonResponse);
      return json;
    }
    return null;
  }
}
