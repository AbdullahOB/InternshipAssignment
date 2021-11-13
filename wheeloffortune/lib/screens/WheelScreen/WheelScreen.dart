import 'package:flutter/material.dart';
import 'package:wheeloffortune/screens/WheelScreen/components/Body.dart';

import '../../constants.dart';

class WheelScreen extends StatefulWidget {
  const WheelScreen({Key? key}) : super(key: key);

  @override
  _WheelScreenState createState() => _WheelScreenState();
}

class _WheelScreenState extends State<WheelScreen> {
  @override
  Widget build(BuildContext context) {
    //returns scaffold with appBar, and body.
    return Scaffold(
      appBar: AppBar(
        title: Text("Spin The Wheel Now"),
        centerTitle: true,
        backgroundColor: appPrimaryColor,
      ),
      body: WheelBody(),
    );
  }
}
