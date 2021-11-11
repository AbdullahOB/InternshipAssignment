import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wheeloffortune/models/wheelModel.dart';
import 'package:wheeloffortune/screens/WheelScreen/components/ArrowView.dart';

class BoardView extends StatefulWidget {
  final double angle;
  final double current;
  final List<WheelModel> items;

  const BoardView(
      {Key? key,
      required this.angle,
      required this.current,
      required this.items})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BoardViewState();
  }
}

class _BoardViewState extends State<BoardView> {
  //Get the number of items and multiply them by 2 for diameter and pi to make it circular.
  double rotate(int index) => (index / widget.items.length) * 2 * pi;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size * 0.8;
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        //shadow
        Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [BoxShadow(blurRadius: 12, color: Colors.black26)]),
        ),
        Transform.rotate(
          angle: -(widget.current + widget.angle) * 2 * pi,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              for (var wheelItem in widget.items) ...[wheelColors(wheelItem)],
              for (var wheelItem in widget.items) ...[wheelPrizes(wheelItem)],
            ],
          ),
        ),
        Container(
          height: size.height,
          width: size.width,
          child: ArrowView(),
        ),
      ],
    );
  }

  wheelColors(WheelModel model) {
    Size size = MediaQuery.of(context).size * 0.8;
    var _rotate = rotate(widget.items.indexOf(model));
    var _angle = 2 * pi / widget.items.length;
    return Transform.rotate(
      angle: _rotate,
      child: ClipPath(
        clipper: WheelPath(_angle),
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [model.color, model.color.withOpacity(0.2)])),
        ),
      ),
    );
  }

  wheelPrizes(WheelModel model) {
    Size size = MediaQuery.of(context).size * 0.34;
    var _rotate = rotate(widget.items.indexOf(model));
    return Transform.rotate(
      angle: _rotate,
      child: Container(
        height: size.height,
        width: size.width,
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints:
              BoxConstraints.expand(height: size.height / 3, width: 44),
          child: Text(
            model.prize,
            style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: 13, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class WheelPath extends CustomClipper<Path> {
  final double angle;

  WheelPath(this.angle);

  @override
  Path getClip(Size size) {
    Path _path = Path();
    Offset _center = size.center(Offset.zero);
    Rect _rect = Rect.fromCircle(center: _center, radius: size.width / 2);
    _path.moveTo(_center.dx, _center.dy);
    _path.arcTo(_rect, -pi / 2 - angle / 2, angle, false);
    _path.close();
    return _path;
  }

  @override
  bool shouldReclip(WheelPath oldClipper) {
    return angle != oldClipper.angle;
  }
}
