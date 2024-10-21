import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherProvider with ChangeNotifier {
  WeatherModel? _weatherDetails;
  WeatherModel? get weatherDetails => _weatherDetails;

  Future<WeatherModel?> fetchWeatherData() async {
    Response response = await get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=34.149433&lon=71.742783&appid=b03d5339fc7672eb5ebbfcc7afb0767f'));
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body.toString());
      print(response.body.toString());
      WeatherModel weatherData = WeatherModel.fromJson(jsonResponse);
      _weatherDetails = weatherData;
      notifyListeners();
      return weatherData;
      // var weatherData = jsonResponse as List;
      // for(Map i in weatherData){
      //   _weatherDetails.add(WeatherModel.fromJson(i));
      // }
    }
    return null;
  }

  double convertTemp(double kelvin) {
    return kelvin - 273.0;
  }

  double convertWind(double humidity) {
    return humidity * 3.6;
  }

  String convertTime(int time) {
    int timeInHours = time ~/ 3600;
    DateTime utcTime = DateTime.now().toUtc();
    DateTime pktTime = utcTime.add(Duration(hours: timeInHours));
    String formattedTime = DateFormat('hh:mm a').format(pktTime);
    return formattedTime;
  }

  String convertSTime(int time) {
    int unixTime = time;
    DateTime utcTime =
        DateTime.fromMillisecondsSinceEpoch(unixTime * 1000, isUtc: true);
    DateTime pktTime = utcTime.add(Duration(hours: 5));
    String formattedTime = DateFormat('hh:mm a').format(pktTime);
    return formattedTime;
  }

  String currentDay (){
   DateTime now = DateTime.now();
   String day = DateFormat('EEEE').format(now);
   return day;
  }
}
