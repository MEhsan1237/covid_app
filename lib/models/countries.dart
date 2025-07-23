import 'dart:convert';
import 'package:covid_app/api/WorldStatesApi.dart';
import 'package:covid_app/models/url.dart';
import 'package:http/http.dart' as http;

class WorldStatesClass {
  Future<WorldStatesApi> fitchWorldStatesApi() async {
    final response = await http.get(Uri.parse(UrlApi.worldStatesApi));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldStatesApi.fromJson(data);
    } else {
      throw Exception("loading");
    }
  }
}

class CountriesStatesClass {
  Future<List<dynamic>> fitchCountriesStatesApi() async {
    var data;
    final response = await http.get(Uri.parse(UrlApi.countriesStatesApi));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception("loading");
    }
  }
}
