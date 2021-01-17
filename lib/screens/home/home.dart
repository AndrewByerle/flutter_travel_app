import 'package:flutter/material.dart';
import 'package:travel_app_boilerplate/screens/search/search.dart';

import 'components/recentSearch.dart';
import 'components/visits.dart';

class Home extends StatelessWidget {
  const Home({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Image.asset('assets/travel_home.png'),
        Visits(),
        RecentSearch(),
        SizedBox(height: 16),
        ExploreButton()
      ],
    ));
  }
}

class ExploreButton extends StatelessWidget {
  const ExploreButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Search()));
        },
        padding: EdgeInsets.symmetric(horizontal: 120, vertical: 10),
        color: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Text('Explore',
            style: TextStyle(color: Colors.white, fontSize: 24)));
  }
}
