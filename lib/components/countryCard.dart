import 'package:flutter/material.dart';
import 'package:travel_app_boilerplate/screens/countryInfo/countryInfo.dart';

class CountryCard extends StatelessWidget {
  final String name;
  final String code;

  CountryCard({this.name, this.code});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        elevation: 5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Container(
            height: 140,
            width: 160,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Column(
                    children: [
                      Image.asset('assets/flags/${code.toLowerCase()}.png',
                          height: 85, width: 160, fit: BoxFit.fill),
                      Container(
                          width: 140,
                          child: Text(name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)))
                    ],
                  ),
                ),
                Positioned.fill(
                    child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CountryInfo(code: code)));
                          },
                        )))
              ],
            ),
          ),
        ));
  }
}
