import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_app/components/no_wheather_widget.dart';
import 'package:wheather_app/components/wheather_widget.dart';
import 'package:wheather_app/cubits/get%20current%20weather%20cubit/get_weather_cubit.dart';
import 'package:wheather_app/cubits/get%20current%20weather%20cubit/get_weather_states.dart';
import 'package:wheather_app/main.dart';
import 'package:wheather_app/models/weather_model.dart';

import 'package:wheather_app/views/search_view.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const SearchView();
                    },
                  ),
                );
              },
              icon: const Icon(
                Icons.search,
                size: 25,
                color: Colors.black,
              ),
            ),
          ],
          centerTitle: true,
          title: const Text(
            'Wheather',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontFamily: 'Kalam',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is NoWeatherState) {
              return const NoWheatherWidget();
            } else if (state is WeatherLoadedState) {
              return WheatherWidget(
                weather: state.weatherModel,
              );
            } else {
              return const Center(
                child: Text(
                  'Oops , Try again Later',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
              );
            }
          },
        ));
  }
}
