import 'package:country_house/pages/Country.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AllCountries extends StatefulWidget {
  const AllCountries({Key? key}) : super(key: key);

  @override
  State<AllCountries> createState() => _AllCountriesState();
}

class _AllCountriesState extends State<AllCountries> {
  List countries = [];
  List filteredCountries = [];
  getCountries() async {
    var response = await Dio().get('https://restcountries.com/v2/all');
    return response.data;
  }

  bool isSearch = false;

  @override
  void initState() {
    getCountries().then((data) {
      setState(() {
        countries = filteredCountries = data;
      });
    });
    super.initState();
  }

  void filterCountries(value) {
    setState(() {
      filteredCountries = countries
          .where((country) =>
              country['name'].toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: !isSearch
            ? Text('All Countries')
            : TextField(
                onChanged: (value) {
                  filterCountries(value);
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    hintText: 'Search Country Here ...',
                    hintStyle: TextStyle(
                      color: Colors.white,
                    )),
              ),
        actions: <Widget>[
          isSearch
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      this.isSearch = !this.isSearch;
                      filteredCountries = countries;
                    });
                  },
                  icon: Icon(Icons.cancel))
              : IconButton(
                  onPressed: () {
                    setState(() {
                      this.isSearch = !this.isSearch;
                    });
                  },
                  icon: Icon(Icons.search))
        ],
      ),
      body: Container(
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: countries.length > 0
                ? ListView.builder(
                    itemCount: filteredCountries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(Country.routename,
                              arguments: {filteredCountries[index]});
                        },
                        child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: Text(filteredCountries[index]['name']),
                            )),
                      );
                    },
                  )
                : Container(
                    width: double.infinity,
                    color: Color.fromARGB(255, 235, 242, 246),
                    child: Center(
                        child: SpinKitDoubleBounce(
                      color: Color.fromARGB(255, 10, 131, 237),
                      size: 50.0,
                    )),
                  )),
      ),
    );
  }
}
