import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wheeloffortune/components/ButtonMain.dart';
import 'package:wheeloffortune/db/winHistory.dart';
import 'package:wheeloffortune/models/winHistoryModel.dart';
import 'package:wheeloffortune/screens/HistoryScreen/components/HistoryCardWidget.dart';

class HistoryBody extends StatefulWidget {
  const HistoryBody({Key? key}) : super(key: key);

  @override
  _HistoryBodyState createState() => _HistoryBodyState();
}

class _HistoryBodyState extends State<HistoryBody> {
  late List<WinHistory> wins;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshWinHistory();
  }

  @override
  void dispose() {
    HistoryDatabase.instance.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isLoading
          ? CircularProgressIndicator()
          : wins.isEmpty
              ? Text(
                  'No Wins',
                  style: TextStyle(color: Colors.black, fontSize: 24),
                )
              : buildHistory(),
    );
  }

  Future refreshWinHistory() async {
    setState(() => isLoading = true);

    wins = await HistoryDatabase.instance.readAllHistory();

    setState(() => isLoading = false);
  }

  Widget buildHistory() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          for (var i in wins)
            HistoryCardWidget(
              winDate: i.winDate!.toIso8601String(),
            ),
        ],
      ),
    );
  }

  Widget buildNotes() => StaggeredGridView.countBuilder(
        padding: EdgeInsets.all(8),
        itemCount: wins.length,
        staggeredTileBuilder: (index) => StaggeredTile.fit(2),
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemBuilder: (context, index) {
          final win = wins[index];

          return GestureDetector(
            onTap: () {
              refreshWinHistory();
            },
            child:
                Text(win.prizeName.toString() + win.winDate!.toIso8601String()),
          );
        },
      );
}
