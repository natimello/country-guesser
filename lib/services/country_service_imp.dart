import 'dart:convert';

import 'package:country_guesser/models/country_model.dart';
import 'package:country_guesser/services/country_service.dart';
import 'package:http/http.dart' as http;

class CountryServiceImp implements CountryService {
  @override
  Future<List<CountryModel>> getAllCountries() async {
    var client = http.Client();
    String url = 'https://restcountries.com/v3.1/all';
    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<CountryModel> countries =
          (jsonDecode(const Utf8Decoder().convert(response.bodyBytes)) as List)
              .map((data) => CountryModel.fromJson(data))
              .toList();

      return countries;
    } else {
      throw Exception('Falha ao buscar países.');
    }
  }
}
