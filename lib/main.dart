import 'package:flutter/material.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    title: 'World Time',
    //theme: new ThemeData(backgroundColor: Colors.white),
    initialRoute: '/',
    routes: {
  '/': (context) => Loading(),
  '/home': (context) => Home(),
  '/loading': (context) => Loading(),
  '/location': (context) => ChooseLocation(),
  },
  ));
}

