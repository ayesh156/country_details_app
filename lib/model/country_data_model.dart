class CountryDataModel {
  String? commonName;
  String? officialName;
  String? flagUrl;
  String? capital;
  int? area;
  int? population;
  String? spellings;
  String? region;
  String? subregion;
  String? continents;
  String? timezones;
  String? startOfWeek;
  String? tld;
  String? googleMap;

  CountryDataModel({
    this.commonName,
    this.officialName,
    this.flagUrl,
    this.capital,
    this.area,
    this.population,
    this.spellings,
    this.region,
    this.subregion,
    this.continents,
    this.timezones,
    this.startOfWeek,
    this.tld,
    this.googleMap,
  });

  factory CountryDataModel.fromJson(Map<String, dynamic> json) {
    return CountryDataModel(
        commonName: json['name']["common"],
        officialName: json['name']["official"],
        flagUrl: json['flags']['png'],
        capital: json['capital'][0],
        area: json['area'],
        population: json['population'],
        spellings: json['altSpellings'][0],
        region: json['region'],
        subregion: json['subregion'],
        continents: json['continents'][0],
        timezones: json['timezones'][0],
        startOfWeek: json['startOfWeek'],
        tld: json['tld'][0],
        googleMap: json['maps']['googleMaps'],
    );
  }
}
