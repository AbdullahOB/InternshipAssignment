import 'package:flutter/material.dart';
import 'package:wheeloffortune/constants.dart';
import 'package:wheeloffortune/screens/MainScreen/components/Body.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wheel Of Fortune"),
        centerTitle: true,
        backgroundColor: appPrimaryColor,
      ),
      body: mainBody(),
    );
  }
}
