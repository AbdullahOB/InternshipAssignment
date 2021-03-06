import 'package:flutter/material.dart';
import 'package:wheeloffortune/db/winHistory.dart';
import 'package:wheeloffortune/models/winHistoryModel.dart';
import 'package:wheeloffortune/screens/HistoryScreen/components/Body.dart';

import '../../constants.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Win History"),
        centerTitle: true,
        backgroundColor: appPrimaryColor,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: appPrimaryColor,
        child: Icon(Icons.delete),
        onPressed: () async {
          await HistoryDatabase.instance.deleteAll();
          Navigator.of(context).pop();
        },
      ),
      body: HistoryBody(),
    );
  }
}
