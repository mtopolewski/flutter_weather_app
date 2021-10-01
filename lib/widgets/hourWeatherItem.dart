import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HourWeatherItem extends StatelessWidget {
  const HourWeatherItem(this.date, this.temperature, {Key? key})
      : super(key: key);
  final DateTime? date;
  final String? temperature;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 80,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(40))),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(40))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
          child: Column(
            children: [
              Text(date != null
                  ? DateFormat("hh a").format(date!)
                  : "N/A"), //date.toString()),
              Expanded(
                child: Center(
                  child: SizedBox(
                    height: 30,
                    child: Image.asset(
                      "assets/cloudy.png",
                      color: Colors.lightBlue,
                    ),
                  ),
                ),
              ),
              Text(temperature != null ? temperature! : "N/A"),
            ],
          ),
        ),
      ),
    );
  }
}
