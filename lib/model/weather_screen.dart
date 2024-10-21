import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/model/weather_provider.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    super.initState();
    final weatherProvider =
        Provider.of<WeatherProvider>(context, listen: false);
    weatherProvider.fetchWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    var heightX = MediaQuery.of(context).size.height;
    var widthX = MediaQuery.of(context).size.width;
    final weatherProvider = Provider.of<WeatherProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0XFF28283A),
        centerTitle: true,
        title: Text(
          'Weather',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: weatherProvider.weatherDetails == null ? Center(
        child: CircularProgressIndicator(),
      ) :
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: heightX * 0.5,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0XFF28283A),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          weatherProvider.currentDay(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: widthX * 0.05),
                        ),
                        Text(
                          weatherProvider
                              .convertTime(
                                  weatherProvider.weatherDetails!.timezone!)
                              .toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: widthX * 0.05,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: heightX * 0.03,
                    ),
                    Text(
                      weatherProvider.weatherDetails!.name!,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: widthX * 0.08),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              weatherProvider
                                      .convertTemp(weatherProvider
                                          .weatherDetails!.main!.temp!)
                                      .toStringAsFixed(0) +
                                  '°C',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: widthX * 0.17),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Feels Like',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: widthX * 0.02,
                                ),
                                Text(
                                  weatherProvider
                                          .convertTemp(weatherProvider
                                              .weatherDetails!
                                              .main!
                                              .feelsLike!)
                                          .toStringAsFixed(0) +
                                      ' °C',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          height: heightX * 0.2,
                          width: widthX * 0.35,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/23.png'))),
                        ),
                        //   Image.asset('assets/23.png', height: widthX * 0.45,),
                        // Image.network('src'),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: heightX * 0.13,
                          width: heightX * 0.13,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0XFFB2AFA7).withOpacity(0.5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.wind_power,
                                  color: Colors.white,
                                  size: 25,
                                ),
                                SizedBox(
                                  height: heightX * 0.002,
                                ),
                                Text(
                                  'Wind',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: heightX * 0.002,
                                ),
                                Text(
                                    weatherProvider
                                        .convertWind(
                                        weatherProvider.weatherDetails!.wind!.speed!)
                                        .toStringAsFixed(2) +
                                    ' km/h', style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: widthX * 0.025,
                        ),
                        Container(
                          height: heightX * 0.13,
                          width: heightX * 0.13,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0XFFB2AFA7).withOpacity(0.5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.thermostat,
                                  color: Colors.white,
                                  size: 25,
                                ),
                                SizedBox(
                                  height: heightX * 0.002,
                                ),
                                Text(
                                  'Pressure',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: heightX * 0.002,
                                ),
                                Text(
                                  weatherProvider.weatherDetails!.main!.pressure!
                                      .toString() +
                                      ' Mb', style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: widthX * 0.025,
                        ),
                        Container(
                          height: heightX * 0.13,
                          width: heightX * 0.13,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0XFFB2AFA7).withOpacity(0.5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.bloodtype_rounded,
                                  color: Colors.white,
                                  size: 25,
                                ),
                                SizedBox(
                                  height: heightX * 0.002,
                                ),
                                Text(
                                  'Humidity',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: heightX * 0.002,
                                ),
                                Text(
                                  weatherProvider.weatherDetails!.main!.humidity!
                                      .toString() +
                                      ' %', style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Weather Type: ' +
                      weatherProvider.weatherDetails!.weather![0].main!
                          .toString()),
                  Text('Weather Description: ' +
                      weatherProvider.weatherDetails!.weather![0].description!
                          .toString()),
                  Text('Sun Rise: ' +
                      weatherProvider
                          .convertSTime(
                              weatherProvider.weatherDetails!.sys!.sunrise!)
                          .toString()),
                  Text('Sun Set: ' +
                      weatherProvider
                          .convertSTime(
                              weatherProvider.weatherDetails!.sys!.sunset!)
                          .toString()),
                ],
              ),
              // Image.network('src'),
            ],
          ),
        ],
      ),
    );
  }
}
