class CountriesStateApi {
  final num updated;
  final String country;
  final CountryInfo countryInfo;
  final num cases;
  final num todayCases;
  final num deaths;
  final num todayDeaths;
  final num recovered;
  final num todayRecovered;
  final num active;
  final num critical;
  final num casesPerOneMillion;
  final num deathsPerOneMillion;
  final num tests;
  final num testsPerOneMillion;
  final num population;
  final String continent;
  final num oneCasePerPeople;
  final num oneDeathPerPeople;
  final num oneTestPerPeople;
  final num activePerOneMillion;
  final num recoveredPerOneMillion;
  final num criticalPerOneMillion;

  CountriesStateApi({
    required this.updated,
    required this.country,
    required this.countryInfo,
    required this.cases,
    required this.todayCases,
    required this.deaths,
    required this.todayDeaths,
    required this.recovered,
    required this.todayRecovered,
    required this.active,
    required this.critical,
    required this.casesPerOneMillion,
    required this.deathsPerOneMillion,
    required this.tests,
    required this.testsPerOneMillion,
    required this.population,
    required this.continent,
    required this.oneCasePerPeople,
    required this.oneDeathPerPeople,
    required this.oneTestPerPeople,
    required this.activePerOneMillion,
    required this.recoveredPerOneMillion,
    required this.criticalPerOneMillion,
  });

  factory CountriesStateApi.fromJson(Map<String, dynamic> json) {
    return CountriesStateApi(
      updated: json['updated'],
      country: json['country'],
      countryInfo: CountryInfo.fromJson(json['countryInfo'] ?? {}),
      cases: json['cases'],
      todayCases: json['todayCases'],
      deaths: json['deaths'],
      todayDeaths: json['todayDeaths'],
      recovered: json['recovered'],
      todayRecovered: json['todayRecovered'],
      active: json['active'],
      critical: json['critical'],
      casesPerOneMillion: json['casesPerOneMillion'],
      deathsPerOneMillion: json['deathsPerOneMillion'],
      tests: json['tests'],
      testsPerOneMillion: json['testsPerOneMillion'],
      population: json['population'],
      continent: json['continent'],
      oneCasePerPeople: json['oneCasePerPeople'],
      oneDeathPerPeople: json['oneDeathPerPeople'],
      oneTestPerPeople: json['oneTestPerPeople'],
      activePerOneMillion: json['activePerOneMillion'],
      recoveredPerOneMillion: json['recoveredPerOneMillion'],
      criticalPerOneMillion: json['criticalPerOneMillion'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'updated': updated,
      'country': country,
      'countryInfo': countryInfo.toJson(),
      'cases': cases,
      'todayCases': todayCases,
      'deaths': deaths,
      'todayDeaths': todayDeaths,
      'recovered': recovered,
      'todayRecovered': todayRecovered,
      'active': active,
      'critical': critical,
      'casesPerOneMillion': casesPerOneMillion,
      'deathsPerOneMillion': deathsPerOneMillion,
      'tests': tests,
      'testsPerOneMillion': testsPerOneMillion,
      'population': population,
      'continent': continent,
      'oneCasePerPeople': oneCasePerPeople,
      'oneDeathPerPeople': oneDeathPerPeople,
      'oneTestPerPeople': oneTestPerPeople,
      'activePerOneMillion': activePerOneMillion,
      'recoveredPerOneMillion': recoveredPerOneMillion,
      'criticalPerOneMillion': criticalPerOneMillion,
    };
  }
}

class CountryInfo {
  final num id;
  final String iso2;
  final String iso3;
  final num lat;
  final num long;
  final String flag;

  CountryInfo({
    required this.id,
    required this.iso2,
    required this.iso3,
    required this.lat,
    required this.long,
    required this.flag,
  });

  factory CountryInfo.fromJson(Map<String, dynamic> json) {
    return CountryInfo(
      id: json['_id'] ?? 0,
      iso2: json['iso2'] ?? '',
      iso3: json['iso3'] ?? '',
      lat: json['lat'] ?? 0,
      long: json['long'] ?? 0,
      flag: json['flag'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'iso2': iso2,
      'iso3': iso3,
      'lat': lat,
      'long': long,
      'flag': flag,
    };
  }
}
