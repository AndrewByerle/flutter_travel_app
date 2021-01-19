import 'package:flutter/material.dart';
import 'package:travel_app_boilerplate/components/countryCard.dart';
import 'package:travel_app_boilerplate/components/loading.dart';
import 'package:travel_app_boilerplate/data/countries.dart';
import 'package:travel_app_boilerplate/models/countryData.dart';

class CountryInfo extends StatefulWidget {
  final String code;

  CountryInfo({this.code});

  @override
  _CountryInfoState createState() => _CountryInfoState();
}

class _CountryInfoState extends State<CountryInfo> {
  CountryData data;
  String neighborCode;
  List<Widget> children;

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

  void generateNeighbors(List<String> neighbors) {
    List<Widget> newChildren = [];
    newChildren.add(SizedBox(width: 10));
    for (String name in data.neighbors) {
      countries.forEach((key, value) {
        if (value == name) {
          neighborCode = key;
        }
      });
      newChildren.add(CountryCard(name: name, code: neighborCode));
      newChildren.add(SizedBox(width: 10));
      children = newChildren;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (data != null) {
      generateNeighbors(data.neighbors);
    }
    return data == null
        ? Loading()
        : Scaffold(
            appBar: AppBar(title: Text(data.name)),
            body: Column(
              children: [
                Image.asset('assets/flags/${data.code.toLowerCase()}.png',
                    height: 250, width: 425, fit: BoxFit.fill),
                SizedBox(height: 16),
                Text('${data.fullName}',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                SizedBox(height: 20),
                LanguageInfo(data: data),
                SizedBox(height: 20),
                InfoLine(data: data, label: 'Currency:', value: data.currency),
                SizedBox(height: 20),
                InfoLine(
                    data: data,
                    label: 'Travel Advisory:',
                    value: data.travelAdvise),
                SizedBox(height: 40),
                InfoLine(data: data, label: 'Neighboring Countries', value: ""),
                ScrollNeighbors(children: children),
              ],
            ));
  }
}

class LanguageInfo extends StatelessWidget {
  const LanguageInfo({
    Key key,
    @required this.data,
  }) : super(key: key);

  final CountryData data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Languages:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text('${data.languages},',
              style: TextStyle(fontSize: 17, color: Colors.redAccent)),
        ],
      ),
    );
  }
}

class InfoLine extends StatelessWidget {
  // const InfoLine({
  //   Key key,
  //   @required this.data,
  //   this.label,
  //   this.value,
  // }) : super(key: key);

  final CountryData data;
  final String label;
  final String value;

  InfoLine({this.data, this.label, this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text(value, style: TextStyle(fontSize: 17, color: Colors.redAccent)),
        ],
      ),
    );
  }
}

class ScrollNeighbors extends StatelessWidget {
  const ScrollNeighbors({
    Key key,
    @required this.children,
  }) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal, child: Row(children: children));
  }
}
