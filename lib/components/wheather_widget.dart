import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_app/cubits/get%20current%20weather%20cubit/get_weather_cubit.dart';
import 'package:wheather_app/main.dart';
import 'package:wheather_app/models/weather_model.dart';

class WheatherWidget extends StatelessWidget {
  const WheatherWidget({super.key, required this.weather});
  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getMaterialColor(weatherModel.weatherCondition),
            getMaterialColor(weatherModel.weatherCondition)[300]!,
            getMaterialColor(weatherModel.weatherCondition)[50]!
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Updated at : ${weatherModel.date.hour}:${weatherModel.date.minute}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network('https:${weatherModel.image}'),
                Text(
                  '${weatherModel.temp.round()}',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
                Column(
                  children: [
                    Text(
                      ' Max Temp : ${weatherModel.maxTemp.round()}',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ' Min Temp : ${weatherModel.minTemp.round()}',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              weatherModel.weatherCondition,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
