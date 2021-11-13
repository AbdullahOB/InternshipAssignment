import 'dart:math';
import 'package:flutter/material.dart';
import 'package:wheeloffortune/constants.dart';

//Make the Arrow in the wheel
class ArrowDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Transform.rotate(
        angle: pi,
        child: Padding(
          padding: EdgeInsets.only(top: 80),
          child: ClipPath(
            clipper: ArrowClipper(),
            child: Container(
              decoration: BoxDecoration(
                color: blackColor,
              ),
              height: 50,
              width: 50,
            ),
          ),
        ),
      ),
    );
  }
}

class ArrowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    Offset _center = size.center(Offset.zero);
    path.lineTo(_center.dx, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(_center.dx, _center.dy);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
