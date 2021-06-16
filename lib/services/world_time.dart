
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late String location;
  late String time;
  late String flag; //url for img
  late String url; //location url for api endpoint
  late bool isDayTime;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      Response response = await get(
          Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
      Map data = jsonDecode(response.body);
      print(data);
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      print(dateTime);
      print(offset);
      String difference = data['utc_offset'][0];
      DateTime now = DateTime.parse(dateTime);
      if (difference == '-') {
        now = now.subtract(Duration(hours: int.parse(offset)));
      }
      else {
        now = now.add(Duration(hours: int.parse(offset)));
      }

      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      print(isDayTime);
      time = DateFormat.jm().format(now);
    }
    catch (e) {
      time = 'could not get the time';
    }


    //print(now);
  }

  /*@override
  void initState() {
    super.initState();
    getTime();
  }*/

}
