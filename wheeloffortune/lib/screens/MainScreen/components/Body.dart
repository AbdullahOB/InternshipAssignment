import 'package:flutter/material.dart';
import 'package:wheeloffortune/components/ButtonMain.dart';
import 'package:wheeloffortune/screens/HistoryScreen/HistoryScreen.dart';
import 'package:wheeloffortune/screens/MainScreen/components/Background.dart';
import 'package:wheeloffortune/screens/WheelScreen/WheelScreen.dart';

class mainBody extends StatefulWidget {
  const mainBody({Key? key}) : super(key: key);

  @override
  _mainBodyState createState() => _mainBodyState();
}

class _mainBodyState extends State<mainBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MainBackground(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: size.height * 0.2,
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
