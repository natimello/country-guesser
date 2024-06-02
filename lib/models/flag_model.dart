class FlagModel {
  final String? png;
  final String? svg;
  final String? alt;

  FlagModel({
    this.png,
    this.svg,
    this.alt,
  });

  factory FlagModel.fromJson(Map<String, dynamic> json) => FlagModel(
        png: json["png"] ?? '',
        svg: json["svg"] ?? '',
        alt: json["alt"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "png": png,
        "svg": svg,
        "alt": alt,
      };
}
