class CityModel {
  final String cityName;
  CityModel({required this.cityName});
  factory CityModel.fromJson(json) {
    return CityModel(
      cityName: json['location']['name'],
    );
  }
}
