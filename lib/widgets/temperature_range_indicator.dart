import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_weather_app1/styles/colors.dart';

class TemperatureRangeIndicator extends StatelessWidget {
  TemperatureRangeIndicator({Key? key}) : super(key: key) {
    _data = <double>[
      20,
      20,
      20,
      19,
      19,
      19,
    ];
  }
  static const double _height = 26;
  static const double _radius = _height / 2;
  static const double _minWidth = 3;

  List<double>? _data;

  List<Widget> _getWidgets() {
    _data!.sort();
    var A = 2 * _data!.length;
    var N = _data!.where((element) => element < 20).length;
    var M = _data!.where((element) => element >= 20).length;
    var startN = A / 2 - N;
    var endM = A / 2 + M;
    List<Widget> result = <Widget>[];
    var x = 0;
    for (int i = 0; i < A; i++) {
      if (i < startN) {
        log("Line start: $i");
        var a = (A / 2 - N) ~/ 2;
        var aa = (A / 2 - N) / 2;
        result.add(_getHorizontalLine(2));
      } else if (i >= startN && i < endM) {
        log("Rect: $i");
        BoxDecoration? boxDecoration = null;
        Color color = _data![x] < 20 ? AppColor.LightBlue2 : AppColor.Red1;
        if (i == startN) {
          boxDecoration = BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(_radius),
              bottomLeft: Radius.circular(_radius),
              //top Radius.circular(20),
            ),
          );
        } else if (i == endM - 1) {
          boxDecoration = BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(_radius),
              bottomRight: Radius.circular(_radius),
              //top Radius.circular(20),
            ),
          );
        } else {
          boxDecoration = BoxDecoration(
            color: color,
          );
        }

        var widget = Container(
          height: _height,
          width: _minWidth * 4,
          decoration: boxDecoration,
        );
        result.add(widget);
        x++;
      } else if (i >= endM) {
        log("Line end: $i");
        var b = (A / 2 - M) ~/ 2;
        var bb = (A / 2 - M) / 2;
        result.add(_getHorizontalLine(2));
      }
    }
    // var a = (A / 2 - N) ~/ 2;
    // var b = (A / 2 - M) ~/ 2;
    // for (int i = 0; i < a; i++) {
    //   result.removeAt(0);
    // }
    // for (int i = 0; i < b; i++) {
    //   result.removeAt(result.length - 1);
    // }

    return result;
  }

  Widget _getHorizontalLine(int i) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (i >= 1)
          Container(
            width: 4,
            height: 1,
            margin: EdgeInsets.symmetric(horizontal: 1),
            color: Colors.grey,
          ),
        if (i > 1)
          Container(
            width: 4,
            height: 1,
            margin: EdgeInsets.symmetric(horizontal: 1),
            color: Colors.grey,
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SizedBox(
            //height: 18,
            child: Text(
              "15°C",
              style: TextStyle(
                  color: AppColor.LightBlue3, fontSize: 18, height: 1),
            ),
          ),
        ),
        ..._getWidgets(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            "23°C",
            style:
                TextStyle(color: AppColor.NavyBlue4, fontSize: 18, height: 1),
          ),
        ),
      ],
    );
  }
}
