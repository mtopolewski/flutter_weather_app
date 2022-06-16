import 'package:flutter/material.dart';
import 'package:flutter_weather_app1/models/forecast_response.dart';
import 'package:flutter_weather_app1/widgets/hourWeatherItem.dart';

class WeatherHorizontalListView extends StatelessWidget {
  const WeatherHorizontalListView({Key? key, required this.forecast})
      : super(key: key);
  final ForecastResponse? forecast;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 30, 0, 0),
      height: 142,
      child: ListView.builder(
        itemCount: forecast != null ? 24 : 0,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          if (forecast != null) {
            var item = forecast?.hourly!.data![index];

            return HourWeatherItem(item?.time, item?.temperature!, item?.icon);
          }

          return Container();
        },
      ),
    );
  }
}
