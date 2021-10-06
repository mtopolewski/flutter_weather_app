import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_weather_app1/styles/colors.dart';
import 'package:intl/intl.dart';

class RainTable extends StatelessWidget {
  const RainTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.grey,
      height: 300,
      //width: double.infinity,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //children: [Text("sunny1"), Text("rainy"), Text("heavy rain")],
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text("Change of rain"),
            ),
            Expanded(
              child: Row(
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ColumnIndicator(DateTime.now()),
                        ColumnIndicator(DateTime.now()),
                        ColumnIndicator(DateTime.now()),
                        ColumnIndicator(DateTime.now()),
                        ColumnIndicator(DateTime.now()),
                        ColumnIndicator(DateTime.now()),
                      ],
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
  ColumnIndicator(this.date, {Key? key}) : super(key: key);
  //final widgetKey = GlobalKey();
  final DateTime date;
  Size? _size;
  List<Widget> _generateLines() {
    var list = <Widget>[];

    for (int i = 0; i < 8; i++) {
      list.add(Container(
        height: 10,
        width: 2,
        color: AppColor.NavyBlue4,
      ));
    }

    return list;
  }

  Size? _getAncestorSize(BuildContext context) {
    Size? size;
    try {
      size = context.size;
    } catch (e) {}

    return size;
  }

  void _postFrameCallback(BuildContext context) {
    _size = _getAncestorSize(context);
    return;
  }

  @override
  Widget build(BuildContext context) {
    return WidgetSize(
      onChange: (size) {
        return;
      },
      child: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                width: 20,
                child: Column(
                  //key: widgetKey,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: _generateLines(),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 20,
                  height: 150, // != null ? _size!.height : 0,
                  decoration: BoxDecoration(
                    color: AppColor.NavyBlue4, //Theme.of(context).hoverColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 30,
            child: Text(DateFormat("ha").format(date)),
          ),
        ],
      ),
    );
  }
}

class WidgetSize extends StatefulWidget {
  final Widget child;
  final Function onChange;

  const WidgetSize({
    Key? key,
    required this.onChange,
    required this.child,
  }) : super(key: key);

  @override
  _WidgetSizeState createState() => _WidgetSizeState();
}

class _WidgetSizeState extends State<WidgetSize> {
  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance!.addPostFrameCallback(postFrameCallback);
    return Container(
      key: widgetKey,
      child: widget.child,
    );
  }

  var widgetKey = GlobalKey();
  var oldSize;

  void postFrameCallback(_) {
    var context = widgetKey.currentContext;
    if (context == null) return;

    var newSize = context.size;
    if (oldSize == newSize) return;

    oldSize = newSize;
    widget.onChange(newSize);
  }
}
