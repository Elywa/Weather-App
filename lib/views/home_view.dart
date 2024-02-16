import 'package:flutter/material.dart';
import 'package:wheather_app/components/no_wheather_widget.dart';
import 'package:wheather_app/components/wheather_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              'assests/images/back.jpg',
            ),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: const Text(
            'Wheather',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontFamily: 'Kalam',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: const WheatherWidget(),
      ),
    );
  }
}
