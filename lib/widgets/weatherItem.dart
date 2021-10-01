import 'package:flutter/material.dart';

class WeatherItem extends StatelessWidget {
  const WeatherItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.2 * MediaQuery.of(context).size.width,
      //color: Colors.lightBlue,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("11",
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 199, 64, 69),
                  //fontFamily: 'Sofia',
                )),
            Icon(Icons.wb_sunny)
          ],
        ),
      ),
    );
  }
}
