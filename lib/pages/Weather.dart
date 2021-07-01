import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';
import 'dart:convert';

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  String cityName = "";
  var temperatureVal;
  var humidity;
  var windspeed;
  var weather;
  Future getWeather(String city) async {
    var url = Uri.parse(
        "http://api.openweathermap.org/data/2.5/weather?q=${city}&units=U.S.&appid=fbf7553156396c9b52e636776044024b");
    http.Response response = await http.get(url);
    var results = json.decode(response.body);
    setState(() {
      temperatureVal = ((results['main']['temp']) - 273.0).toStringAsFixed(2);
      weather = results['weather'][0]['main'];
      humidity = results['main']['humidity'];
      windspeed = (results['wind']['speed'] * 3.6).toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    String cityName = ModalRoute.of(context)!.settings.arguments.toString();
    String result = cityName.substring(7, cityName.length - 1);
    print(result);
    getWeather(result);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('Current Weather'),
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.deepOrange.shade300, Colors.white])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Currently in",
                  style: TextStyle(
                    fontSize: 14.0,
                    letterSpacing: 0.0,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Text(result.toUpperCase(),
                    style: TextStyle(
                      fontSize: 27.0,
                      letterSpacing: 1.0,
                      color: Colors.black,
                      fontFamily: "Garamond",
                    ))
              ],
            ),
          ),
          Container(
            child: Expanded(
              child: Container(
                color: Colors.white,
                child: ListView(children: [
                  ListTile(
                      leading: FaIcon(FontAwesomeIcons.temperatureHigh),
                      title: Text(
                        "   Temperature",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      trailing: Text("$temperatureVal\u00b0")),
                  SizedBox(
                    height: 16.0,
                  ),
                  ListTile(
                      leading: FaIcon(FontAwesomeIcons.cloudRain),
                      title: Text(
                        "   Weather",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      trailing: Text("$weather")),
                  SizedBox(
                    height: 16.0,
                  ),
                  ListTile(
                      leading: FaIcon(FontAwesomeIcons.water),
                      title: Text(
                        "   Humidity",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      trailing: Text("$humidity %")),
                  SizedBox(
                    height: 16.0,
                  ),
                  ListTile(
                      leading: FaIcon(FontAwesomeIcons.wind),
                      title: Text(
                        "     Windspeed",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      trailing: Text("$windspeed kmph"))
                ]),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
