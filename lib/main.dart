import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/model/weather_provider.dart';
import 'package:weather_app/model/weather_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=> WeatherProvider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherScreen(),
    ),);
  }
}


