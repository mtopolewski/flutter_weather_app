import 'package:flutter/material.dart';
import 'package:flutter_weather_app1/pages/next_days_page.dart';
import 'package:flutter_weather_app1/styles/appStrings.dart';

class DaySelector extends StatelessWidget {
  const DaySelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: DefaultTabController(
            length: 2,
            child: TabBar(
              //indicatorWeight: 0,
              padding: EdgeInsets.zero,
              labelPadding: EdgeInsets.zero,
              //indicator: null,
              indicatorColor: Colors.transparent,
              tabs: [
                DayButton(
                  AppStrings.today,
                  () {},
                  isSelected: true,
                ),
                DayButton(AppStrings.tomorrow, () {}),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/${NextDaysPage.name}');
          },
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Next 7 Days",
                    style: TextStyle(fontSize: 16, color: Colors.lightBlue),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                    ),
                  )
                ],
              ),
              Container(
                height: 16,
              )
            ],
          ),
        ),
        // DayButton("Today", () {}),
        // DayButton("Tomorrow", () {}),
        // TextButton(
        //   onPressed: () {
        //     Navigator.pushNamed(context, '/${NextDaysPage.name}');
        //   },
        //   child: Column(
        //     children: [
        //       Row(
        //         children: [
        //           Text(
        //             "Next 7 Days",
        //             style: TextStyle(fontSize: 18, color: Colors.lightBlue),
        //           ),
        //           Padding(
        //             padding: const EdgeInsets.only(left: 8),
        //             child: Icon(
        //               Icons.arrow_forward_ios,
        //               size: 14,
        //             ),
        //           )
        //         ],
        //       ),
        //       Container(
        //         height: 16,
        //       )
        //     ],
        //   ),
        // ),
      ],
    );
  }
}

class DayButton extends StatefulWidget {
  DayButton(this._title, this._onTap, {Key? key, this.isSelected = false})
      : super(key: key);

  final String _title;
  final Function _onTap;
  bool isSelected = false;

  @override
  _DayButtonState createState() => _DayButtonState();
}

class _DayButtonState extends State<DayButton> {
  void _OnTap() {
    setState(() {
      widget.isSelected = !widget.isSelected;
    });
    widget._onTap.call();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _OnTap,
      child: Column(
        children: [
          Text(
            widget._title,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          Container(
            height: 16,
            padding: const EdgeInsets.only(top: 4),
            child: widget.isSelected
                ? Icon(
                    Icons.circle,
                    size: 12,
                    color: Colors.white,
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
