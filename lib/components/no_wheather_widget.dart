import 'package:flutter/material.dart';

class NoWheatherWidget extends StatelessWidget {
  const NoWheatherWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Would you like to Know Wheather ? 😄',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Kalam',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: Text(
              'search now 🔎☝🏻',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Kalam',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
