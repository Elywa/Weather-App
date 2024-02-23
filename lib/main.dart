import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_app/cubits/get%20current%20weather%20cubit/get_weather_cubit.dart';
import 'package:wheather_app/cubits/get%20current%20weather%20cubit/get_weather_states.dart';
import 'package:wheather_app/models/weather_model.dart';
import 'package:wheather_app/views/home_view.dart';

void main() {
  runApp(Base());
}

class Base extends StatelessWidget {
  Base({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                appBarTheme: AppBarTheme(
                  backgroundColor: getMaterialColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.weatherCondition,
                  ),
                ),
                // primarySwatch: getMaterialColor(
                //   BlocProvider.of<GetWeatherCubit>(context)
                //       .weatherModel
                //       ?.weatherCondition,
                // ),
              ),
              home: HomeView(),
            );
          },
        );
      }),
    );
  }
}

MaterialColor getMaterialColor(String? condition) {
  if (condition == null) {
    return Colors.lime;
  }
  switch (condition) {
    case 'Sunny':
    case 'Clear':
      return Colors.orange;
    case 'Cloudy':
    case 'Overcast':
    case 'Mist':
    case 'Fog':
    case 'Freezing fog':
      return Colors.grey;
    case 'Patchy rain possible':
    case 'Light drizzle':
    case 'Light rain':
    case 'Moderate rain':
    case 'Heavy rain':
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
    case 'Light sleet':
    case 'Moderate or heavy sleet':
    case 'Patchy light snow':
    case 'Light snow':
    case 'Patchy moderate snow':
    case 'Moderate snow':
    case 'Patchy heavy snow':
    case 'Heavy snow':
    case 'Ice pellets':
    case 'Light rain shower':
    case 'Moderate or heavy rain shower':
    case 'Torrential rain shower':
    case 'Light sleet showers':
    case 'Moderate or heavy sleet showers':
    case 'Light snow showers':
    case 'Moderate or heavy snow showers':
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
    case 'Blowing snow':
    case 'Blizzard':
      return Colors.lightBlue;
    case 'Thundery outbreaks possible':
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
    case 'Patchy light snow with thunder':
    case 'Moderate or heavy snow with thunder':
      return Colors.deepPurple;

    default:
      return Colors.lightBlue;
  }
}
