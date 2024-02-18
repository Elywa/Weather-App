import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:wheather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '36b0fbce96154973b5b143354241702';
  WeatherService({required this.dio});

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response respone = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(respone.data);
      return weatherModel;
    } on DioException catch (e) {
      String errorMessage = e.response?.data['error']['message'] ??
          "oops there was an error, try again later !";
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there was an error  , try again later !');
    }
  }
}
