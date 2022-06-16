import 'package:flutter/material.dart';
import 'package:flutter_weather_app1/helpers/icon_name_to_icon_file_name.dart';
import 'package:flutter_weather_app1/models/forecast_response.dart';
import 'package:flutter_weather_app1/styles/appStrings.dart';
import 'package:intl/intl.dart';

class WeatherTile extends StatelessWidget {
  const WeatherTile({Key? key, @required this.forecast}) : super(key: key);
  final ForecastResponse? forecast;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: SizedBox(
                  child: forecast?.currently != null
                      ? Image.asset(
                          IconNameToIconFileName.get(
                            forecast!.currently!.icon!,
                          ),
                          color: Colors.lightBlue,
                        )
                      : Container(),
                  width: 40,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.today,
                    style: TextStyle(fontSize: 26),
                  ),
                  Text(
                    DateFormat("E, d MMM").format(DateTime.now()),
                    style: TextStyle(fontSize: 12),
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 130,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                forecast?.currently != null
                    ? forecast!.currently!.temperature!.toStringAsFixed(0)
                    : AppStrings.na,
                style: TextStyle(fontSize: 120, height: 0.95),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, left: 10),
                child: Text(
                  AppStrings.celsiusDegree,
                  style: TextStyle(fontSize: 36, height: 0.95),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Row(
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
            ],
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
                "${AppStrings.feelsLike}${forecast != null && forecast?.currently != null ? forecast?.currently!.apparentTemperature!.toStringAsFixed(0) : "N/A"}"),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 2, 10, 0),
              child: Icon(
                Icons.circle,
                size: 6,
              ),
            ),
            Text(
              //DateFormat("hha").format(date!)
              "${AppStrings.sunset} ${forecast?.daily != null ? DateFormat("HH:mm").format(forecast!.daily!.data![0].sunsetTime!) : "N/A"}",
            ),
          ],
        ),
      ],
    );
  }
}
