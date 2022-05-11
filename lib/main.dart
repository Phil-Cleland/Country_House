import 'package:country_house/pages/CountryMap.dart';
import 'package:flutter/material.dart';
import 'pages/AllCountries.dart';
import 'pages/CountryMap.dart';
import 'pages/Country.dart';
import 'pages/AllCountries.dart';
import 'pages/home.dart';






void main()=>runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Home(),

  routes: {
    CountryMap.routename:(context) => CountryMap(),
    Country.routename:(context) => Country(),
    AllCountries.routename:(context) => AllCountries()
  },
));