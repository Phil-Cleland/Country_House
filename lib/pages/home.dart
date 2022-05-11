
import 'package:country_house/pages/AllCountries.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
         Container(
          width: double.infinity,
          height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/blueworld.jpg'),
                    fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 400,),
                RaisedButton.icon(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  color: Colors.lightBlue,
                    onPressed: () {
                      Navigator.pushNamed(context, AllCountries.routename);
                    },
                    icon: Icon(Icons.edit_location),
                    label: Text('Edit Location'))
              ],
            ),
      ),
    );
  }
}
