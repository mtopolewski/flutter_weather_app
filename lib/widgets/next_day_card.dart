import 'package:flutter/material.dart';
import 'package:flutter_weather_app1/helpers/icon_name_to_icon_file_name.dart';
import 'package:flutter_weather_app1/models/forecast_daily_data.dart';
import 'package:flutter_weather_app1/styles/colors.dart';
import 'package:intl/intl.dart';

class NextDayCard extends StatelessWidget {
  const NextDayCard(this._data, {Key? key}) : super(key: key);

  final ForecastDailyData? _data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 6,
        shadowColor: Colors.black,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        DateFormat("EEEE").format(_data!.time!),
                        style:
                            TextStyle(color: AppColor.NavyBlue4, fontSize: 18),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: SizedBox(
                          height: 24,
                          child: Image.asset(
                            IconNameToIconFileName.get(
                              _data!.icon!,
                            ),
                            color: Colors.lightBlue,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "${_data!.temperatureHigh!.toStringAsFixed(0)}°C",
                        style:
                            TextStyle(color: AppColor.NavyBlue4, fontSize: 24),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "${_data!.temperatureHigh!.toStringAsFixed(0)}°C",
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                        ),
                      )
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  columnWidths: <int, TableColumnWidth>{
                    0: FlexColumnWidth(),
                    1: FlexColumnWidth(),
                    2: FixedColumnWidth(20),
                    3: FlexColumnWidth(),
                    4: FlexColumnWidth(),
                  },
                  children: [
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            "Wind",
                            style: TextStyle(color: AppColor.NavyBlue4),
                          ),
                        ),
                        Text(
                          "${_data!.windSpeed!.toStringAsFixed(0)} mph",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Container(),
                        Text(
                          "Humidity",
                          style: TextStyle(color: AppColor.NavyBlue4),
                        ),
                        Text(
                          "${(_data!.humidity! * 100).toStringAsFixed(0)}%",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            "Visibility",
                            style: TextStyle(color: AppColor.NavyBlue4),
                          ),
                        ),
                        Text(
                          "${_data!.visibility!.toStringAsFixed(0)} mi",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Container(),
                        Text(
                          "UV",
                          style: TextStyle(color: AppColor.NavyBlue4),
                        ),
                        Text(
                          _data!.uvIndex.toString(),
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
