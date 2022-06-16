import 'package:flutter/material.dart';
import 'package:flutter_weather_app1/models/forecast_response.dart';
import 'package:flutter_weather_app1/providers/weather_provider.dart';
import 'package:flutter_weather_app1/styles/appStrings.dart';
import 'package:flutter_weather_app1/widgets/day_selector.dart';
import 'package:flutter_weather_app1/widgets/rain_table.dart';
import 'package:flutter_weather_app1/widgets/weather_horizontal_list_view.dart';
import 'package:flutter_weather_app1/widgets/weather_tile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isInitialized = false;

  // @override
  // void initState() {
  //   Provider.of<WeatherProvider>(context).fetchForecast(53.01, 18.56);
  //   super.initState();
  // }

  @override
  void didChangeDependencies() {
    if (!_isInitialized) {
      _isInitialized = true;
      Provider.of<WeatherProvider>(context).fetchForecast(53.01, 18.56);
      super.didChangeDependencies();
    }
  }

  @override
  Widget build(BuildContext context) {
    ForecastResponse? _forecast =
        Provider.of<WeatherProvider>(context, listen: false).forecast;

    // if (!_isInitialized) {
    //   _isInitialized = true;

    // }

    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          leading: TextButton(
            child: Icon(Icons.segment),
            style: TextButton.styleFrom(primary: Colors.white),
            onPressed: () {},
          ),
          title: Text(AppStrings.weatherForecast),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                WeatherTile(forecast: _forecast),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 30, right: 30, top: 20, bottom: 0),
                  child: DaySelector(),
                ),
                WeatherHorizontalListView(forecast: _forecast),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                  child: _forecast != null &&
                          _forecast.hourly != null &&
                          _forecast.hourly!.data != null
                      ? RainTable(_forecast.hourly!.data)
                      : Container(),
                ),
              ],
            ),
          ),
        ));
  }
}
