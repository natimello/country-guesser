import 'package:country_guesser/domain/controllers/country_controller.dart';
import 'package:country_guesser/domain/pages/guess_country_view.dart';
import 'package:country_guesser/services/country_service_imp.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: GuessCountryView(
        controller: CountryController(service: CountryServiceImp())),
  ));
}
