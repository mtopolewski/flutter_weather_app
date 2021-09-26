import 'package:flutter/material.dart';
import 'package:flutter_weather_app1/widgets/imageHeader.dart';
import 'package:flutter_weather_app1/widgets/weatherItem.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            Stack(
              children: [
                ImageHeader(),
                Container(
                    height: 0.6 * MediaQuery.of(context).size.height,
                    padding: EdgeInsets.only(right: 50, bottom: 5),
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Icon(Icons.add, color: Colors.blue),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                        primary: Colors.white,
                        onPrimary: Colors.blue, // <-- Splash color
                      ),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 32),
              child: Text(
                "SAN FRANCISCO",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: 18),
              ),
            ),
            Container(
              height: 0.14 * MediaQuery.of(context).size.height,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  WeatherItem(),
                  WeatherItem(),
                  WeatherItem(),
                  WeatherItem(),
                  WeatherItem(),
                  WeatherItem(),
                  WeatherItem(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
