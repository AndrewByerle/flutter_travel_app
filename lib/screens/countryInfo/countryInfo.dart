import 'package:flutter/material.dart';
import 'package:travel_app_boilerplate/components/loading.dart';
import 'package:travel_app_boilerplate/models/countryData.dart';

class CountryInfo extends StatefulWidget {
  final String code;

  CountryInfo({this.code});

  @override
  _CountryInfoState createState() => _CountryInfoState();
}

class _CountryInfoState extends State<CountryInfo> {
  CountryData data;

  Future<void> fetchData(String code) async {
    CountryData instance = new CountryData(code: code);
    await instance.getData();

    setState(() {
      data = instance;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData(widget.code);
  }

  @override
  Widget build(BuildContext context) {
    return data == null
        ? Loading()
        : Scaffold(appBar: AppBar(title: Text(data.name)));
  }
}
