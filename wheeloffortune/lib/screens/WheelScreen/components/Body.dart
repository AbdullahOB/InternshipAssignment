import 'dart:math';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:wheeloffortune/constants.dart';
import 'package:wheeloffortune/db/winHistory.dart';
import 'package:wheeloffortune/models/wheelModel.dart';
import 'package:wheeloffortune/models/winHistoryModel.dart';
import 'WheelDesign.dart';

class WheelBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WheelBody();
  }
}

class _WheelBody extends State<WheelBody> with SingleTickerProviderStateMixin {
  late final WinHistory? wins;

  //Angle will start from 0 and will end with 0.
  double angle = 0;
  //Current Angle
  double current = 0;
  //Controller for animation
  late AnimationController controller;
  //Animation instance from Animation Class
  late Animation animation;
  //Make a list of prizes and it's colors, all the colors are changable.
  List<WheelModel> wheelItems = [
    WheelModel("Iphone", appPrimaryColor),
    WheelModel("Ipad", secondColor),
    WheelModel("AppleWatch", appPrimaryColor),
    WheelModel("Laptop", secondColor),
    WheelModel("PC", appPrimaryColor),
    WheelModel("Macbook", secondColor),
    WheelModel("TV", appPrimaryColor),
    WheelModel("PS5", secondColor),
  ];

  @override
  //Define the duration that will be applied for rotation
  void initState() {
    var duration = Duration(milliseconds: 5000);
    controller = AnimationController(vsync: this, duration: duration);
    animation =
        //define the animation type, For our case is fast out slow in to make accelartion
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        //Background Color
        decoration: BoxDecoration(color: Colors.white),

        child: AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              final value = animation.value;
              //check value
              //print(value);
              final _angle = value * this.angle;
              return Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  //Board view instance and it will take three params which are Items , Current and Angle
                  WheelDesign(
                      items: wheelItems, current: current, angle: _angle),
                  //Call goButton Function
                  spinButton(value),
                ],
              );
            }),
      ),
    );
  }

  spinButton(val) {
    return Material(
      color: Colors.white,
      shape: CircleBorder(),
      child: InkWell(
        customBorder: CircleBorder(),
        child: Container(
          alignment: Alignment.center,
          height: 72,
          width: 72,
          child: Text(
            "Spin",
            style: TextStyle(
                color: secondColor,
                fontSize: 22.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        //call animation function
        onTap: () {
          animationFun(val);
        },
      ),
    );
  }

  animationFun(value) {
    if (!controller.isAnimating) {
      var _random = Random().nextDouble();
      angle = 20 + Random().nextInt(5) + _random;
      controller.forward(from: 0.0).then((val) {
        current = (current + _random);
        current = current - current ~/ 1;
        resultOutput(value);
        controller.reset();
      });
    }
  }

  int calIndex(value) {
    var base = (pi / wheelItems.length) / (2 * pi);
    return (((base + value) % 1) * wheelItems.length).floor();
  }

  resultOutput(_value) {
    var index = calIndex(_value * angle + current);
    String prizes = wheelItems[index].prize;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 50.0),
      child: Align(
        alignment: Alignment.center,
        child: winShowModal(context, prizes),
      ),
    );
  }

  winShowModal(context, prize) {
    //add post frame callback so the wheel will not rotate immaditley.
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Alert(
        context: context,
        title: "Congrats!",
        desc: "You have earned a prize " + prize,
        buttons: [
          DialogButton(
            child: Text(
              "Claim Prize",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              Navigator.pop(context);
              addWinToHistory(prize);
            },
            color: appPrimaryColor,
          )
        ],
      ).show();
    });
  }

//add the prize to History
  Future addWinToHistory(prize) async {
    final win = WinHistory(
      prizeName: prize,
      winDate: DateTime.now(),
    );

//create new record in database
    await HistoryDatabase.instance.create(win);
  }
}
