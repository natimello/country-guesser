class NameModel {
  final String? common;
  final String? official;

  NameModel({this.common, this.official});

  factory NameModel.fromJson(Map<String, dynamic> json) => NameModel(
        common: json["common"] ?? '',
        official: json["official"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "common": common,
        "official": official,
      };
}
