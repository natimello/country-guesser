import 'package:country_guesser/models/country_model.dart';

abstract class CountryService {
  Future<List<CountryModel>> getAllCountries();
}
