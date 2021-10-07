import 'package:flutter/material.dart';
import 'package:flutter_weather_app1/models/forecast_response.dart';
import 'package:flutter_weather_app1/providers/weather_provider.dart';
import 'package:flutter_weather_app1/widgets/day_selector.dart';
import 'package:flutter_weather_app1/widgets/hourWeatherItem.dart';
import 'package:flutter_weather_app1/widgets/rain_table.dart';
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
          title: Text("Weather Forecast"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 45,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                                child: SizedBox(
                                  child: Image.asset(
                                    "assets/cloudy.png",
                                    color: Colors.lightBlue,
                                  ),
                                  width: 40,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Today",
                                    style: TextStyle(fontSize: 26),
                                  ),
                                  Text(
                                    "Sat, 3 Aug",
                                    style: TextStyle(fontSize: 12),
                                  )
                                ],
                              )
                            ],
                          ),
                          Container(
                            height: 100,
                            //color: Colors.amber,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _forecast != null &&
                                          _forecast.currently != null
                                      ? _forecast.currently!.temperature!
                                          .toStringAsFixed(0)
                                      : "N/A",
                                  style: TextStyle(fontSize: 120, height: 0.95),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 12, left: 10),
                                  child: Text(
                                    "°C",
                                    style:
                                        TextStyle(fontSize: 36, height: 0.95),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(mainAxisSize: MainAxisSize.min, children: [
                            Text("Barcelona, Spain"),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                              child: Icon(
                                Icons.ios_share,
                                size: 14,
                              ),
                            ),
                          ]),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("Feels like 32"),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 2, 10, 0),
                                child: Icon(
                                  Icons.circle,
                                  size: 4,
                                ),
                              ),
                              Text("Sunset 20:15"),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: DaySelector(),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 55,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
                            height: 142,
                            child: ListView.builder(
                              itemCount: _forecast != null ? 24 : 0,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (ctx, index) {
                                if (_forecast != null) {
                                  var item = _forecast.hourly!.data![index];

                                  return HourWeatherItem(
                                      item.time, item.temperature!);
                                }

                                return Container();
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                            child: RainTable(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
