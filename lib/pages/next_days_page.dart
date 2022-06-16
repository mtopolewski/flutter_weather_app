import 'package:flutter/material.dart';
import 'package:flutter_weather_app1/models/forecast_response.dart';
import 'package:flutter_weather_app1/providers/weather_provider.dart';
import 'package:flutter_weather_app1/styles/colors.dart';
import 'package:flutter_weather_app1/widgets/next_day_card.dart';
import 'package:flutter_weather_app1/widgets/next_day_item.dart';
import 'package:provider/provider.dart';

class NextDaysPage extends StatefulWidget {
  const NextDaysPage({Key? key}) : super(key: key);
  static String name = "nextDays";

  @override
  State<NextDaysPage> createState() => _NextDaysPageState();
}

class _NextDaysPageState extends State<NextDaysPage> {
  @override
  Widget build(BuildContext context) {
    ForecastResponse? _forecast =
        Provider.of<WeatherProvider>(context, listen: false).forecast;

    return Scaffold(
      backgroundColor: AppColor.LightBlue,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: TextButton(
          child: Icon(Icons.segment),
          style: TextButton.styleFrom(
            primary: AppColor.NavyBlue4,
          ),
          onPressed: () {},
        ),
        title: Text(
          "Weather Forecast",
          style: TextStyle(color: AppColor.NavyBlue4),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              child: Icon(
                Icons.arrow_back_ios,
                color: AppColor.NavyBlue4,
              ),
              style: TextButton.styleFrom(primary: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Next 7 days",
                style: TextStyle(fontSize: 24, color: AppColor.NavyBlue4),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    NextDayCard(_forecast!.daily!.data![2]),
                    // Expanded(
                    //   child: Container(
                    //     color: Colors.red,
                    //     //height: 100,
                    //   ),
                    // )
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: ListView.builder(
                          itemCount: _forecast.daily!.data!.length,
                          itemBuilder: (context, index) =>
                              NextDayItem(_forecast.daily!.data![0]),
                        ),
                      ),
                    )
                    // ListView.builder(
                    //   physics: const NeverScrollableScrollPhysics(),
                    //   itemCount: _forecast.daily!.data!.length,
                    //   itemBuilder: (context, index) =>
                    //       NextDayItem(_forecast.daily!.data![0]),
                    // )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
