import 'package:flutter/material.dart';
import 'package:wheeloffortune/constants.dart';
import 'package:wheeloffortune/screens/MainScreen/MainScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Disable debug banner
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        //Select the app primary color from constants.dart file
        primaryColor: appPrimaryColor,
        //Make scaffolds background white
        scaffoldBackgroundColor: Colors.white,
      ),
      //Title of project
      title: 'Wheel of Fortune',
      //The first page that the application will start from
      home: MainScreen(),
    );
  }
}
