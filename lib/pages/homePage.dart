import 'package:flutter/material.dart';
import 'package:flutter_weather_app1/models/forecast_response.dart';
import 'package:flutter_weather_app1/providers/weather_provider.dart';
import 'package:flutter_weather_app1/widgets/hourWeatherItem.dart';
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  Center(
                    child: Row(
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
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _forecast != null && _forecast.currently != null
                            ? _forecast.currently!.temperature!
                                .toStringAsFixed(0)
                            : "N/A",
                        style: TextStyle(fontSize: 90),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 26, 0, 0),
                        child: Text(
                          "°C",
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Barcelona, Spain"),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: Icon(
                          Icons.ios_share,
                          size: 14,
                        ),
                      ),
                      // TextButton(
                      //   onPressed: () {},
                      //   child: Icon(Icons.ios_share),
                      //   style: TextButton.styleFrom(primary: Colors.white),
                      // )
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Feels like 32"),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 2, 10, 0),
                        child: Icon(
                          Icons.circle,
                          size: 4,
                        ),
                      ),
                      Text("Sunset 20:15"),
                    ],
                  ),
                  Container(
                    height: 140,
                    child: ListView.builder(
                      itemCount: _forecast != null
                          ? _forecast.hourly!.data!.length
                          : 0,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, index) {
                        if (_forecast != null) {
                          var item = _forecast.hourly!.data![index];

                          return HourWeatherItem(DateTime.now(),
                              item.temperature!.toStringAsFixed(1));
                        }

                        return Container();
                      },
                    ),
                    // child: ListView(
                    //   scrollDirection: Axis.horizontal,
                    //   children: [HourWeatherItem(DateTime.now(), "10")],
                    // ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
