import 'package:flutter/material.dart';
import 'package:wheeloffortune/components/ButtonMain.dart';
import 'package:wheeloffortune/screens/HistoryScreen/HistoryScreen.dart';
import 'package:wheeloffortune/screens/WheelScreen/WheelScreen.dart';

class mainBody extends StatefulWidget {
  const mainBody({Key? key}) : super(key: key);

  @override
  _mainBodyState createState() => _mainBodyState();
}

//make main screen with image and two buttons "Spin the wheel" and "See The History"

class _mainBodyState extends State<mainBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Positioned(
                top: size.height * 0.53,
                left: 0,
                right: 0,
                child: Image.asset(
                  "assets/images/wheel.png",
                  width: size.width,
                )),
            SizedBox(
              height: size.height * 0.05,
            ),
            ButtonMain(
                text: "Spin The Wheel",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return WheelScreen();
                      },
                    ),
                  );
                }),
            SizedBox(
              height: size.height * 0.01,
            ),
            ButtonMain(
                text: "See The History",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HistoryScreen();
                      },
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
