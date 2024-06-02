import 'package:country_guesser/models/flag_model.dart';
import 'package:country_guesser/models/name_model.dart';

class CountryModel {
  final NameModel? name;
  final List<String>? capital;
  final List<String>? continents;
  final FlagModel? flags;

  CountryModel({
    this.name,
    this.capital,
    this.continents,
    this.flags,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      name: json["name"] == null ? null : NameModel.fromJson(json["name"]),
      capital: json["capital"] == null
          ? []
          : List<String>.from(json["capital"]!.map((c) => c)),
      continents: json["continents"] == null
          ? []
          : List<String>.from(json["continents"]!.map((c) => c)),
      flags: json["flags"] == null ? null : FlagModel.fromJson(json["flags"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name?.toJson(),
        "capital":
            capital == null ? [] : List<dynamic>.from(capital!.map((c) => c)),
        "continents": continents == null
            ? []
            : List<dynamic>.from(continents!.map((c) => c)),
        "flags": flags?.toJson(),
      };
}
