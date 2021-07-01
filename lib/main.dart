import 'package:flutter/material.dart';
import 'package:weather_application/pages/EnterLoc.dart';
import 'package:weather_application/pages/Weather.dart';

void main() {
  runApp(new MaterialApp(initialRoute: '/', routes: {
    '/': (context) => EnterLoc(),
    '/location': (context) => Weather()
  }));
}
