import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:country_guesser/domain/controllers/country_state.dart';
import 'package:country_guesser/models/country_model.dart';
import 'package:country_guesser/services/country_service.dart';

class CountryController extends Cubit<CountryState> {
  final CountryService service;

  CountryController({required this.service}) : super(CountryState.initial());

  Future<void> getAllCountries() async {
    try {
      List<CountryModel> countries = await service.getAllCountries();

      emit(state.copyWith(
          status: CountryStatus.success, allCountries: countries));
    } catch (e) {
      emit(state.copyWith(status: CountryStatus.failure));
    }
  }

  Future<void> getRandomCountry() async {
    final CountryModel country;

    try {
      List<CountryModel> allCountries = state.allCountries!;
      var randomIndex = Random().nextInt(allCountries.length);
      country = allCountries[randomIndex];

      print(country.name!.common!);

      emit(state.copyWith(status: CountryStatus.success, country: country));
    } catch (e) {
      emit(state.copyWith(status: CountryStatus.failure));
    }
  }

  bool checkAnswer(String answer) => answer == state.country!.name!.common ||
          answer == state.country!.name!.official
      ? true
      : false;
}
