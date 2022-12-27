import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:newsapi/screen/home/modal/PostModal.dart';

class HomeProvider extends ChangeNotifier{
int i = 0;
  String newsapilink = "https://newsapi.org/v2/everything?q=tesla&from=2022-13-12&sortBy=publishedAt&apiKey=f3781e78f19f43508aa4c5651bca879b";

void bootomindex(int index){
  i = index;
  notifyListeners();
}
  Future<PostModal> apiCalling() async {
    var jsonString = await http.get(Uri.parse(newsapilink));
    var json = jsonDecode(jsonString.body);

    return  PostModal.fromJson(json);
  }
}