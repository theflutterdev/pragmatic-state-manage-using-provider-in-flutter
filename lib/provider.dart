import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkCall extends ChangeNotifier{
  List data;
  bool isLoading = false;

  void loadData()async{
    isLoading = true;
    notifyListeners();
    var response = await http.get(Uri.encodeFull("https://jsonplaceholder.typicode.com/photos"));
    if(response.statusCode == 200){
      String responseBody = response.body;
      data = json.decode(responseBody);
      isLoading = false;
      notifyListeners();
    }else{
      print("Something went worng!");
    }
  }

  NetworkCall();
  
}