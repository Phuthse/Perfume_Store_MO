import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:perfume_store_mo/model/perfume.dart';

class NetworkRequest {
  static const String url = 'https://10.0.2.2:7036/api/v1/perfumes';

  static List<Perfume> parsePerfume (String responseBody){
    var list = json.decode(responseBody) as List<dynamic>;
    List<Perfume> perfumes = list.map((model) => Perfume.fromJson(model)).toList();
    return perfumes;
  }

  static Future<List<Perfume>> fetchPerfumes() async{
    
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      return compute(parsePerfume, response.body);
    }else if(response.statusCode == 404){
      throw Exception('Not Found');
    }else{
      throw Exception('Can\'t get perfume');
    }
  }

}