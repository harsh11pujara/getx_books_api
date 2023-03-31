import 'dart:convert';

import 'package:books_app_getx/books_model.dart';
import 'package:http/http.dart' as http;
class BooksServices{

  Future<List<BookModel>> fetchApiData() async{
    List<BookModel> data = [];
    String url = 'https://hapi-books.p.rapidapi.com/nominees/romance/2020';
    Map<String, String> headers = {
      'X-RapidAPI-Key': '95dec2daf5msh7101e337d101d6dp185d0ejsnbb0ecd8632a3',
      'X-RapidAPI-Host': 'hapi-books.p.rapidapi.com'
    };
    var response  = await http.get(Uri.parse(url),headers: headers);
    print(response);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body) as List;
      print("json data " + json.toString());
      data = json.map((e) {
        return BookModel.fromJson(e);
      }).toList();
    }
    return data;
  }
}