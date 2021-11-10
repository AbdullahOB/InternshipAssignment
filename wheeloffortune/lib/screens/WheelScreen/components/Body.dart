import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class WheelBody extends StatefulWidget {
  const WheelBody({Key? key}) : super(key: key);

  @override
  _WheelBodyState createState() => _WheelBodyState();
}

class _WheelBodyState extends State<WheelBody> {
  StreamController<int> selected = StreamController<int>();
  @override
  Widget build(BuildContext context) {
    final items = <String>[
      'Iphone',
      'Ipad',
      'PC',
      'PS5',
      'TV',
      'Samsung Phone',
      'Laptop',
      'Apple Watch',
    ];
    return GestureDetector(
      onTap: () {
        setState(() {
          selected.add(
            Fortune.randomInt(2, 200),
          );
        });
      },
      child: Column(
        children: [
          Expanded(
            child: FortuneWheel(
              selected: selected.stream,
              items: [
                for (var item in items) FortuneItem(child: Text(item)),
                
              ],
            ),
          ),
          Expanded(
            child: Text("Te"),
          )
        ],
      ),
    );
  }
}
