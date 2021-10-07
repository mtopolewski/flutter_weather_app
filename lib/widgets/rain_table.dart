import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_weather_app1/styles/colors.dart';
import 'package:intl/intl.dart';

class RainTable extends StatelessWidget {
  const RainTable({Key? key}) : super(key: key);
  static const height = 180.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.grey,
      height: height,
      //width: double.infinity,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //children: [Text("sunny1"), Text("rainy"), Text("heavy rain")],
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text("Change of rain", style: TextStyle(fontSize: 18)),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 40,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("sunny"),
                              Text("rainy"),
                              Text("heavy rain"),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        //crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ColumnIndicator(DateTime.now(), height, 50),
                          ColumnIndicator(DateTime.now(), height, 80),
                          ColumnIndicator(DateTime.now(), height, 60),
                          ColumnIndicator(DateTime.now(), height, 50),
                          ColumnIndicator(DateTime.now(), height, 60),
                          ColumnIndicator(DateTime.now(), height, 60),
                          ColumnIndicator(DateTime.now(), height, 100),
                        ],
                      ),
                      // child: Row(
                      //   crossAxisAlignment: CrossAxisAlignment.stretch,
                      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //   mainAxisSize: MainAxisSize.max,
                      //   children: [
                      //     ColumnIndicator(DateTime.now(), height, 50),
                      //     ColumnIndicator(DateTime.now(), height, 80),
                      //     ColumnIndicator(DateTime.now(), height, 60),
                      //     ColumnIndicator(DateTime.now(), height, 50),
                      //     ColumnIndicator(DateTime.now(), height, 60),
                      //     ColumnIndicator(DateTime.now(), height, 60),
                      //     //ColumnIndicator(DateTime.now(), height, 60),
                      //   ],
                      // ),
                    ),
                  ),
                  // Container(
                  //   height: double.infinity,
                  //   width: 2,
                  //   color: Colors.red,
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ColumnIndicator extends StatelessWidget {
  ColumnIndicator(this.date, this.height, this.percentage, {Key? key})
      : super(key: key) {
    columnHeight = height - 86;
  }
  final DateTime date;
  final double height;
  final double percentage;
  double? columnHeight;

  List<Widget> _generateLines() {
    var list = <Widget>[];

    var n = height / 25;

    for (int i = 0; i < n; i++) {
      list.add(Container(
        height: 6,
        width: 1.5,
        color: AppColor.NavyBlue4,
      ));
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 56) / 6,
      //color: Colors.amber,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            //color: Colors.red,
            child: Stack(
              children: [
                SizedBox(
                  width: 20,
                  height: columnHeight,
                  child: Column(
                    //key: widgetKey,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: _generateLines(),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 20,
                      height: (percentage / 100) *
                          columnHeight!, // != null ? _size!.height : 0,
                      decoration: BoxDecoration(
                        color:
                            AppColor.NavyBlue4, //Theme.of(context).hoverColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 11),
            child: SizedBox(
              height: 30,
              child: Text(DateFormat("ha").format(date)),
            ),
          ),
        ],
      ),
    );
  }
}
