import 'package:flutter/material.dart';

class WeatherItem extends StatelessWidget {
  const WeatherItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.2 * MediaQuery.of(context).size.width,
      //color: Colors.lightBlue,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Text("11"), Icon(Icons.wb_sunny)],
        ),
      ),
    );
  }
}
