import 'package:flutter/material.dart';
import 'package:travel_app_boilerplate/components/countryCard.dart';

class RecentSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Title(),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: 12),
              CountryCard(name: "United States", code: "US"),
              CountryCard(name: "Netherlands", code: "NL"),
              CountryCard(name: "Canada", code: "CA"),
              SizedBox(width: 12),
            ],
          ),
        )
      ],
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Recent Searches",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          FlatButton(
              onPressed: () {},
              child: Text("See All", style: TextStyle(fontSize: 16)))
        ],
      ),
    );
  }
}
