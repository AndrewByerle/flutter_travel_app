import 'package:flutter/material.dart';
import 'package:travel_app_boilerplate/components/countryCard.dart';
import 'package:travel_app_boilerplate/data/countries.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<Widget> children;

  @override
  void initState() {
    super.initState();
    getCountryList("");
  }

  void getCountryList(String text) {
    List<Widget> newChildren = [];
    text = text.toLowerCase();

    countries.forEach((key, value) {
      if (key.toLowerCase().contains(text) ||
          value.toLowerCase().contains(text)) {
        newChildren.add(Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: CountryCard(code: key, name: value),
        ));
      }
    });

    setState(() {
      children = newChildren;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: TextField(
                decoration: InputDecoration(
                    hintText: "Find your destination...",
                    hintStyle: TextStyle(color: Colors.white70, fontSize: 18),
                    border: InputBorder.none),
                style: TextStyle(color: Colors.white, fontSize: 18),
                onChanged: getCountryList)),
        body: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1.25,
          children: children,
        ));
  }
}
