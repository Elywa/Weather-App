import 'package:flutter/material.dart';

import 'package:wheather_app/components/wheather_widget.dart';
import 'package:wheather_app/views/search_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              color: Colors.white,
            ),
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
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
    );
  }
}
