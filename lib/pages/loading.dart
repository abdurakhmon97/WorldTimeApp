import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String text = 'loading';

  void setupWorldTime() async {
    WorldTime wt = new WorldTime(
        location: 'Tashkent', flag: 'uzbekistan.png', url: 'Asia/Samarkand');
    //on purpose delay to see the loading page longer
    //await Future.delayed(Duration(seconds: 3));
    await wt.getTime();
    //print(wt.time);
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': wt.location,
      'flag': wt.flag,
      'time': wt.time,
      'isDayTime': wt.isDayTime,
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
