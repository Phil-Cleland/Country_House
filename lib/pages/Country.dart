import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/avd.dart';
import 'package:country_house/pages/CountryMap.dart';

class Country extends StatelessWidget {
  // final Map country;
  // Country(this.country);

  static const routename = '/country';

  @override
  Widget build(BuildContext context) {
    final country = ModalRoute.of(context)!.settings.arguments as Map;

    print(country);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(country['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: <Widget>[
            FlipCard(
                front: CountryCard('Capital'),
                back: BackCard(country['capital'])),
            FlipCard(
                front: CountryCard('Population'),
                back: BackCard(country['population'].toString())),
            FlipCard(
                front: CountryCard('Currency'),
                back: BackCard(country['currencies'][0]['name'])),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(CountryMap.routename, arguments: {
                  'name': country['name'],
                  'lat': country['lat']

                });
              },
              child: CountryCard('Show Map'),
            ),
          ],
        ),
      ),
    );
  }
}

class CountryCard extends StatelessWidget {
  final String title;
  CountryCard(this.title);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 10,
        child: Center(
            child: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, letterSpacing: 5),
        )));
  }
}

class BackCard extends StatelessWidget {
  final String title;
  BackCard(this.title);
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.lightBlue,
        elevation: 10,
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                letterSpacing: 5),
          ),
        )));
  }
}
