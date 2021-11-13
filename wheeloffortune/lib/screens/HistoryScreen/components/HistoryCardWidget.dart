import 'package:flutter/material.dart';
import 'package:wheeloffortune/constants.dart';

class HistoryCardWidget extends StatelessWidget {
  const HistoryCardWidget({Key? key, required this.winDate}) : super(key: key);
  final String winDate;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: 230,
      child: Stack(
        children: [
          Positioned(
            top: 35,
            left: 20,
            child: Material(
              child: Container(
                height: 180,
                width: size.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(0.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        offset: const Offset(-10.0, 10.0),
                        blurRadius: 20.0,
                        spreadRadius: 4.0),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              top: 0,
              left: 30,
              child: Card(
                elevation: 10.0,
                color: appPrimaryColor,
                shadowColor: Colors.grey.withOpacity(0.6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Container(
                  height: 200,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/images/ps5.png"))),
                ),
              )),
          Positioned(
              top: 45,
              left: 200,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Playstation 5",
                      style: TextStyle(
                          fontSize: 22,
                          color: appPrimaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Divider(
                      color: Colors.black,
                      height: 20,
                    ),
                    Text(
                      "Win Date: " + winDate,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "You can claim your prize\n by calling : +1234567890",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
