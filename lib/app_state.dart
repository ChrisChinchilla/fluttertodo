import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AppState with ChangeNotifier {

  String _dataUrl = "https://api.trello.com/1/members/chrischinchilla/cards?filter=visible&key=13f8c59607ba6d82531d3db5f46999c1&token=1f1de99d152dbb70bf94210eb8fb588b136f60282cd3e6e5ae4d7380a19dae9f";

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
