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
                image: AssetImage('assets/landscape.jpeg'),
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
                      height: 300,
                      width: double.infinity,
                      color: Color.fromRGBO(255, 255, 255, 1)),
                ),
                ClipPath(
                  clipper: SecondClipper(),
                  child: Container(
                      height: 300,
                      width: double.infinity,
                      color: Color.fromRGBO(255, 255, 255, 120)),
                ),
                ClipPath(
                  clipper: ThirdClipper(),
                  child: Container(
                      height: 300,
                      width: double.infinity,
                      color: Color.fromRGBO(255, 255, 255, 120)),
                ),
              ],
            ),
          )
        ],
      ),
    );
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
