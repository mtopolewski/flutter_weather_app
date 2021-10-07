import 'package:flutter/material.dart';

class DaySelector extends StatelessWidget {
  const DaySelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        DayButton("Today", () {}),
        DayButton("Tomorrow", () {}),
        TextButton(
          onPressed: () {},
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Next 7 Days",
                    style: TextStyle(fontSize: 18, color: Colors.lightBlue),
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
      ],
    );
  }
}

class DayButton extends StatefulWidget {
  DayButton(this._title, this._onTap, {Key? key}) : super(key: key);

  final String _title;
  final Function _onTap;
  bool _isSelected = false;

  @override
  _DayButtonState createState() => _DayButtonState();
}

class _DayButtonState extends State<DayButton> {
  void _OnTap() {
    setState(() {
      widget._isSelected = !widget._isSelected;
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
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          Container(
            height: 16,
            padding: const EdgeInsets.only(top: 4),
            child: widget._isSelected
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
