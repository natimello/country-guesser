import 'package:country_guesser/models/country_model.dart';
import 'package:equatable/equatable.dart';

enum CountryStatus {
  initial,
  loading,
  success,
  failure,
}

class CountryState extends Equatable {
  final CountryStatus status;
  final List<CountryModel>? allCountries;
  final CountryModel? country;

  CountryState({required this.status, this.allCountries, this.country});

  @override
  List<Object?> get props => [status, allCountries, country];

  const CountryState._({
    required this.status,
    this.allCountries,
    this.country,
  });

  CountryState.initial() : this._(status: CountryStatus.initial);

  CountryState copyWith({
    CountryStatus? status,
    List<CountryModel>? allCountries,
    CountryModel? country,
  }) {
    return CountryState._(
      status: status ?? this.status,
      allCountries: allCountries ?? this.allCountries,
      country: country ?? this.country,
    );
  }
}
