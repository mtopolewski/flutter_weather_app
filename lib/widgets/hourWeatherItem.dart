import 'package:flutter/material.dart';
import 'package:flutter_weather_app1/helpers/icon_name_to_icon_file_name.dart';
import 'package:intl/intl.dart';

class HourWeatherItem extends StatelessWidget {
  const HourWeatherItem(this.date, this.temperature, this.iconName, {Key? key})
      : super(key: key);
  final DateTime? date;
  final double? temperature;
  final String? iconName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1540,
      width: 72,
      padding: const EdgeInsets.all(1),
      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 6),
      decoration: BoxDecoration(
          color: Theme.of(context).shadowColor,
          borderRadius: BorderRadius.all(Radius.circular(40))),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).hoverColor,
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
          child: Column(
            children: [
              Text(date != null
                  ? DateFormat("hha").format(date!)
                  : "N/A"), //date.toString()),
              Expanded(
                child: Center(
                  child: Container(
                    child: SizedBox(
                      height: 30,
                      child: iconName != null
                          ? Image.asset(
                              IconNameToIconFileName.get(iconName!),
                              //"assets/cloudy.png",
                              color: Colors.white,
                            )
                          : Container(),
                    ),
                    height: 42,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
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
                      temperature != null
                          ? temperature!.toStringAsFixed(0)
                          : "N/A",
                      style: TextStyle(fontSize: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 1),
                      child: Text("°C"),
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
