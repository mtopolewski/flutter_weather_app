import 'package:flutter/material.dart';

class ImageHeader extends StatelessWidget {
  const ImageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 0.6 * MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 1),
              child: Image(
                fit: BoxFit.fitWidth,
                image: AssetImage('assets/landscape1.jpeg'),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Stack(
              children: [
                ClipPath(
                  clipper: FirstClipper(),
                  child: Container(
                      height: 200,
                      width: double.infinity,
                      color: Color.fromRGBO(255, 255, 255, 1)),
                ),
                ClipPath(
                  clipper: SecondClipper(),
                  child: Container(
                      height: 200,
                      width: double.infinity,
                      color: Color.fromRGBO(255, 255, 255, 120)),
                ),
                ClipPath(
                  clipper: ThirdClipper(),
                  child: Container(
                      height: 200,
                      width: double.infinity,
                      color: Color.fromRGBO(255, 255, 255, 120)),
                ),
              ],
            ),
          ),
          // ClipOval(
          //   child: Container(
          //     height: 100,
          //     width: 100,
          //     //color: Colors.yellow,
          //     child: TextButton(
          //         onPressed: () {},
          //         child: Container(
          //           height: 40,
          //           //color: Colors.amber,
          //           child: FittedBox(
          //               child: Icon(Icons.arrow_upward_sharp,
          //                   color: Color(0xFFB6093C))),
          //         )),
          //     decoration: BoxDecoration(
          //       shape: BoxShape.circle,
          //       color: Colors.white,
          //       boxShadow: [
          //         BoxShadow(
          //           color: Colors.transparent, //Color(0xFFDADADA),
          //           blurRadius: 6.0,
          //           offset: Offset(0, 0),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class FirstClipper1 extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double a = 0;
    var curvePositionY = 6 / 8;
    var path = new Path();

    // var zeroCP = Offset(size.width / 2, 90);
    // var zeroEP = Offset(size.width, 0);

    var firstCP = Offset(size.width / 4, 0 - a);
    var firstEP = Offset(size.width / 2.9, 30);

    var secondCP = Offset(size.width / 2, 60);
    var secondEP = Offset(size.width / 1.5, 30);

    var thirdCP = Offset(size.width - 50, 0);
    var thirdEP = Offset(size.width, 0);

    path.lineTo(0, a);
    path.quadraticBezierTo(firstCP.dx, firstCP.dy, firstEP.dx, firstEP.dy);
    path.quadraticBezierTo(secondCP.dx, secondCP.dy, secondEP.dx, secondEP.dy);
    //path.lineTo(10, curvePositionY * size.height);
    //path.quadraticBezierTo(firstCP.dx, firstCP.dy, firstEP.dx, firstEP.dy);
    //path.quadraticBezierTo(secondCP.dx, secondCP.dy, secondEP.dx, secondEP.dy);
    //path.quadraticBezierTo(thirdCP.dx, thirdCP.dy, thirdEP.dx, thirdEP.dy);
    //path.lineTo(size.width * 0.75, 40);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}

class FirstClipper0 extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var g1 = 40;
    var d1 = 2 * g1;
    var g2 = 1 * g1;
    var curvePositionY = 6 / 8;
    var path = new Path();

    var firstControlPoint =
        Offset(size.width / 6, curvePositionY * size.height - g1);
    var firstEndPoint = Offset(size.width / 3, curvePositionY * size.height);
    var secondControlPoint =
        Offset(3 * size.width / 4, curvePositionY * size.height + d1);
    var secondEndPoint = Offset(size.width, curvePositionY * size.height - g2);

    var firstCP = Offset(size.width / 4, curvePositionY * size.height - 16);
    var firstEP = Offset(size.width / 2, curvePositionY * size.height + 50);

    path.lineTo(0, curvePositionY * size.height);
    //path.lineTo(10, curvePositionY * size.height);
    path.quadraticBezierTo(firstCP.dx, firstCP.dy, firstEP.dx, firstEP.dy);
    //path.lineTo(0.5 * size.width, curvePositionY * size.height + 50);
    path.lineTo(size.width, curvePositionY * size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    // path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
    //     firstEndPoint.dx, firstEndPoint.dy);

    // path.lineTo(0, curvePositionY * size.height);
    // path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
    //     firstEndPoint.dx, firstEndPoint.dy);
    // path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
    //     secondEndPoint.dx, secondEndPoint.dy);

    // path.lineTo(size.width, curvePositionY * size.height);
    // path.lineTo(size.width, size.height);
    // path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}

class FirstClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var g1 = 40;
    var d1 = 2 * g1;
    var g2 = 1 * g1;
    var curvePositionY = 6 / 8;
    var path = new Path();
    path.lineTo(0, curvePositionY * size.height);

    var firstControlPoint =
        Offset(size.width / 6, curvePositionY * size.height - g1);
    var firstEndPoint = Offset(size.width / 3, curvePositionY * size.height);
    var secondControlPoint =
        Offset(3 * size.width / 4, curvePositionY * size.height + d1);
    var secondEndPoint = Offset(size.width, curvePositionY * size.height - g2);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, curvePositionY * size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}

class SecondClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var d1 = 120;
    var g1 = 80;
    var curvePositionY = 1 / 8;
    var path = new Path();
    path.lineTo(0, curvePositionY * size.height);

    var firstControlPoint =
        Offset(size.width / 4, curvePositionY * size.height + d1);
    var firstEndPoint =
        Offset(size.width / 2, curvePositionY * size.height + d1 / 2);
    var secondControlPoint =
        Offset(3 * size.width / 4, curvePositionY * size.height);
    var secondEndPoint = Offset(size.width, curvePositionY * size.height);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, curvePositionY * size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}

class ThirdClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var d1 = 40;
    var g1 = 90;
    var curvePositionY = 4 / 8;
    var path = new Path();
    path.lineTo(0, curvePositionY * size.height);

    var firstControlPoint =
        Offset(size.width / 4, curvePositionY * size.height + d1);
    var firstEndPoint =
        Offset(size.width / 2, curvePositionY * size.height + d1 / 2);
    var secondControlPoint =
        Offset(3 * size.width / 4, curvePositionY * size.height);
    var secondEndPoint = Offset(size.width, curvePositionY * size.height - g1);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, curvePositionY * size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
