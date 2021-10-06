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
                      child: Image.asset(
                        "assets/cloudy.png",
                        color: Colors.white,
                      ),
                    ),
                    height: 40,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
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
