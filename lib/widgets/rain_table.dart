import 'package:flutter/material.dart';
import 'package:flutter_weather_app1/models/forecast_hourly_model.dart';
import 'package:flutter_weather_app1/styles/appStrings.dart';
import 'package:flutter_weather_app1/styles/colors.dart';
import 'package:intl/intl.dart';

class RainTable extends StatefulWidget {
  const RainTable(this.data, {Key? key}) : super(key: key);
  static const height = 180.0;
  final List<ForecastHourlyModel>? data;

  @override
  State<RainTable> createState() => _RainTableState();
}

class _RainTableState extends State<RainTable> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.grey,
      height: RainTable.height,
      //width: double.infinity,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child:
                  Text(AppStrings.changeOfRain, style: TextStyle(fontSize: 18)),
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
                              Text(AppStrings.sunny),
                              Text(AppStrings.rainy),
                              Text(AppStrings.heavyRain),
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
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.data != null
                          ? widget.data!.length < 24
                              ? widget.data!.length
                              : 24
                          : 0,
                      itemBuilder: (context, index) => ColumnIndicator(
                        widget.data![index].time!,
                        RainTable.height,
                        widget.data != null &&
                                widget.data![index].precipProbability != null
                            ? (1 - widget.data![index].precipProbability!) * 100
                            : 0,
                        isSelected: index == _selectedIndex,
                      ),
                    ),
                  ),
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
  ColumnIndicator(this.date, this.height, this.percentage,
      {Key? key, this.isSelected = false})
      : super(key: key) {
    columnHeight = height - 86;
  }
  final DateTime date;
  final double height;
  final double percentage;
  double? columnHeight;
  final bool isSelected;

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
      width: (MediaQuery.of(context).size.width - 80) / 6,
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
                        color: isSelected
                            ? AppColor.yellow
                            : AppColor
                                .NavyBlue4, //Theme.of(context).hoverColor,
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
