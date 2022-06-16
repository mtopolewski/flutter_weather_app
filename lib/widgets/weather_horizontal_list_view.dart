import 'package:flutter/material.dart';
import 'package:flutter_weather_app1/models/forecast_response.dart';
import 'package:flutter_weather_app1/widgets/hourWeatherItem.dart';

class WeatherHorizontalListView extends StatefulWidget {
  const WeatherHorizontalListView({Key? key, required this.forecast})
      : super(key: key);
  final ForecastResponse? forecast;

  @override
  State<WeatherHorizontalListView> createState() =>
      _WeatherHorizontalListViewState();
}

class _WeatherHorizontalListViewState extends State<WeatherHorizontalListView> {
  final int _selectedItemIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.fromLTRB(20, 30, 0, 0),
      height: 160,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: widget.forecast != null ? 24 : 0,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          if (widget.forecast != null) {
            var item = widget.forecast?.hourly!.data![index];

            return Padding(
              padding: index == 0
                  ? const EdgeInsets.only(left: 16)
                  : const EdgeInsets.all(0),
              child: HourWeatherItem(
                item?.time,
                item?.temperature!,
                item?.icon,
                isSelected: _selectedItemIndex == index,
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}
