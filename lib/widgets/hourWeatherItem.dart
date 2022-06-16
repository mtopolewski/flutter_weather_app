import 'package:flutter/material.dart';
import 'package:flutter_weather_app1/helpers/icon_name_to_icon_file_name.dart';
import 'package:flutter_weather_app1/styles/appStrings.dart';
import 'package:flutter_weather_app1/styles/colors.dart';
import 'package:intl/intl.dart';

class HourWeatherItem extends StatefulWidget {
  const HourWeatherItem(
    this.date,
    this.temperature,
    this.iconName, {
    Key? key,
    this.isSelected = false,
  }) : super(key: key);
  final DateTime? date;
  final double? temperature;
  final String? iconName;
  final bool isSelected;

  @override
  State<HourWeatherItem> createState() => _HourWeatherItemState();
}

class _HourWeatherItemState extends State<HourWeatherItem> {
  late final bool _isSelected;

  @override
  void initState() {
    _isSelected = widget.isSelected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      alignment: _isSelected ? Alignment.topCenter : Alignment.bottomCenter,
      child: Container(
        height: 142,
        width: 72,
        padding: const EdgeInsets.all(1),
        margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 6),
        decoration: BoxDecoration(
          color: Theme.of(context).shadowColor,
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: _isSelected ? AppColor.white : AppColor.DarkBlue,
            borderRadius: BorderRadius.all(
              Radius.circular(40),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
            child: Column(
              children: [
                Text(
                  widget.date != null
                      ? DateFormat("hha").format(widget.date!)
                      : AppStrings.na,
                  style: TextStyle(
                    color: _isSelected ? AppColor.NavyBlue4 : AppColor.white,
                  ),
                ), //date.toString()),
                Expanded(
                  child: Center(
                    child: Container(
                      child: SizedBox(
                        height: 30,
                        child: widget.iconName != null
                            ? Image.asset(
                                IconNameToIconFileName.get(widget.iconName!),
                                //"assets/cloudy.png",
                                color: _isSelected
                                    ? AppColor.lightBlue4
                                    : AppColor.white,
                              )
                            : Container(),
                      ),
                      height: 42,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: _isSelected
                            ? AppColor.LightBlue2
                            : AppColor.darkBlue2,
                        borderRadius: BorderRadius.all(
                          Radius.circular(21),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.temperature != null
                            ? widget.temperature!.toStringAsFixed(0)
                            : AppStrings.na,
                        style: TextStyle(
                          fontSize: 20,
                          color:
                              _isSelected ? AppColor.NavyBlue4 : AppColor.white,
                        ),
                      ),
                      Text(
                        AppStrings.celsiusDegree,
                        style: TextStyle(
                          fontSize: 12,
                          color:
                              _isSelected ? AppColor.NavyBlue4 : AppColor.white,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
