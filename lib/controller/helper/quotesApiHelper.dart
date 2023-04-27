import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../modal/quotesModal.dart';
import 'QuotesGlobal.dart';

class QuotesApiHelper {
  QuotesApiHelper._();
  static final QuotesApiHelper quotesApiHelper = QuotesApiHelper._();

  // List allCategory = [
  //   'age',
  //   'alone',
  //   'amazing',
  // ];
  Future<List<Quotes>?> fetchData() async {
    String uri = "https://api.api-ninjas.com/v1/quotes?category=";
    String api = uri +Global.endpoint;

    http.Response res = await http.get(
      Uri.parse(api),
      headers: {'X-Api-Key': '3eqJfi0fHICw9Azgd8pXDA==S3jZ4Xl0tKf7WdRW'},
    );
    if (res.statusCode == 200) {
      List decodedData = jsonDecode(res.body);
      print("${res.statusCode}");
      print(res.body);
      List<Quotes> data =
          decodedData.map((e) => Quotes.fromJson(json: e)).toList();
      return data;
    }
    else {
      return null;
    }
  }
}

// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:quotes_app/modal/quotesModal.dart';
//
// import 'QuotesGlobal.dart';
//
// class QuotesApiHelper {
//   QuotesApiHelper._();
//   static final QuotesApiHelper quotesApiHelper = QuotesApiHelper._();
//
//   Future<Quotes?> fetchData() async {
//     String baseUrl = "https://api.api-ninjas.com/v1/quotes?category=";
//
//     String api = baseUrl + Global.endpoint;
//     http.Response res = await http.get(
//       Uri.parse(api),
//       headers: {'X-Api-Key': '3eqJfi0fHICw9Azgd8pXDA==S3jZ4Xl0tKf7WdRW'},
//     );
//
//     if (res.statusCode == 200) {
//       Map decode = jsonDecode(res.body);
//
//       Quotes quotes = Quotes.fromJson(json: decode);
//
//       return quotes;
//     }
//     return null;
//   }
// }
