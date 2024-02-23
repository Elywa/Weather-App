import 'package:wheather_app/models/weather_model.dart';

class WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherModel weatherModel;
  WeatherLoadedState({required this.weatherModel});
}

class NoWeatherState extends WeatherState {}

class WeatherFailureState extends WeatherState {
  final String errorMessage;
  WeatherFailureState({required this.errorMessage});
}
