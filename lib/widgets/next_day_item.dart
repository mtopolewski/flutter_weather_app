import 'package:flutter/material.dart';
import 'package:flutter_weather_app1/helpers/icon_name_to_icon_file_name.dart';
import 'package:flutter_weather_app1/models/forecast_daily_data.dart';
import 'package:intl/intl.dart';

class NextDayItem extends StatelessWidget {
  const NextDayItem(this._data, {Key? key}) : super(key: key);
  final ForecastDailyData? _data;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              DateFormat("EE").format(_data!.time!),
              style: TextStyle(color: Colors.blue),
            ),
            Row(
              children: [
                SizedBox(
                  height: 16,
                  child: Image.asset(
                    "assets/rain.png",
                    color: Colors.blue,
                  ),
                ),
                Text(
                  "${(_data!.precipProbability! * 100).toStringAsFixed(0)}%",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 40,
          child: Image.asset(
            IconNameToIconFileName.get(
              _data!.icon!,
            ),
          ),
        ),
        Container(
          color: Colors.red,
          height: 20,
          width: 100,
        )
      ],
    ));
  }
}
