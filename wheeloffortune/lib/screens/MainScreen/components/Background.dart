import 'package:flutter/material.dart';

class MainBackground extends StatelessWidget {
  final Widget child;

  const MainBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
              top: size.height * 0.03,
              left: 0,
              right: 0,
              child: Image.asset(
                "assets/images/wheel.png",
                width: size.width * 0.3,
              )),
          child,
        ],
      ),
    );
  }
}
