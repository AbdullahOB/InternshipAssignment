import 'package:flutter/material.dart';

import '../constants.dart';

class ButtonMain extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color, textColor;

  const ButtonMain({
    Key? key,
    required this.text,
    required this.press,
    this.color = appPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      width: size.width * 0.5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        // ignore: deprecated_member_use
        child: FlatButton(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            color: color,
            onPressed: press,
            child: Text(
              text,
              style: TextStyle(color: textColor),
            )),
      ),
    );
  }
}
