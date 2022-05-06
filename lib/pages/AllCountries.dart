import 'package:country_house/pages/Country.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AllCountries extends StatefulWidget {
  const AllCountries({Key? key}) : super(key: key);

  @override
  State<AllCountries> createState() => _AllCountriesState();
}

class _AllCountriesState extends State<AllCountries> {
  Future<List> countries = Future.value([]);
  Future<List> getCountries() async {
    var response = await Dio().get('https://restcountries.com/v2/all');
    return response.data;
  }

  void Hey() async {
    var response = await Dio().get('https://restcountries.com/v2/all');
    print(response.data);
  }

  @override
  void initState() {
    countries = getCountries();
    Hey();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(countries);
    return Scaffold(
      appBar: AppBar(
        title: Text('All Countries'),
        centerTitle: true,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: FutureBuilder<List>(
              future: countries,
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return Country(snapshot.data?[index]);
                          }));
                        },
                        child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: Text(snapshot.data?[index]['name']),
                            )),
                      );
                    },
                  );
                }
                return Text('');
              }),
          // child: ListView(
          //   children: <Widget>[
          //
          //     GestureDetector(
          //       onTap: () {
          //         Navigator.of(context)
          //             .push(MaterialPageRoute(builder: (context) {
          //           return Country('Russia');
          //         }));
          //       },
          //       child: Card(
          //           elevation: 10,
          //           child: Padding(
          //             padding: const EdgeInsets.symmetric(
          //                 vertical: 10, horizontal: 15),
          //             child: Text('Russia'),
          //           )),
          //     ),
          //   ],
          // )
        ),
      ),
    );
  }
}
