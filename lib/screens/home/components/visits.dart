import 'package:flutter/material.dart';

class Visits extends StatelessWidget {
  const Visits({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(26.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          VisitsItem(title: "Countries Visited", number: 12),
          VisitsItem(title: "Want to Visit", number: 20),
          VisitsItem(title: "Total Countries", number: 251)
        ],
      ),
    );
  }
}

class VisitsItem extends StatelessWidget {
  final String title;
  final int number;

  VisitsItem({this.title, this.number});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: 100,
            child: Text(title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
        SizedBox(height: 18),
        Text(number.toString(),
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue))
      ],
    );
  }
}
