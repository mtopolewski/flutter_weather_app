import 'package:flutter/material.dart';
import 'package:flutter_weather_app1/pages/homePage.dart';
import 'package:flutter_weather_app1/providers/weather_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WeatherProvider(),
      child: MaterialApp(
        home: HomePage(),
        theme: ThemeData(
          primaryColor: Color(0xFF0F1039),
          hoverColor: Color(0xFF1D1F43),
          shadowColor: Color(0xFF36375E),
          backgroundColor: Color(0xFF181A41),
          brightness: Brightness.dark,
          fontFamily: 'Sofia',
        ),
      ),
    );
  }
}
