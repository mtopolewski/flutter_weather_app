import 'package:flutter/material.dart';
import 'package:flutter_weather_app1/helpers/icon_name_to_icon_file_name.dart';
import 'package:flutter_weather_app1/models/forecast_daily_data.dart';
import 'package:flutter_weather_app1/styles/colors.dart';
import 'package:flutter_weather_app1/widgets/temperature_range_indicator.dart';
import 'package:intl/intl.dart';

class NextDayItem extends StatelessWidget {
  const NextDayItem(this._data, {Key? key}) : super(key: key);
  final ForecastDailyData? _data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat("EE").format(_data!.time!).toUpperCase(),
                style: TextStyle(
                  color: AppColor.NavyBlue4,
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    height: 14,
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
              ),
            ],
          ),
          SizedBox(
            height: 28,
            child: Image.asset(
              IconNameToIconFileName.get(
                _data!.icon!,
              ),
              color: Colors.blue,
            ),
          ),
          TemperatureRangeIndicator(),
        ],
      ),
    );
  }
}
