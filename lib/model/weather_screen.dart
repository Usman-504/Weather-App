import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/model/weather_provider.dart';

import '../components/custom_container.dart';

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
        backgroundColor: const Color(0XFF28283A),
        centerTitle: true,
        title: const Text(
          'Weather',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: weatherProvider.weatherDetails == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: heightX * 0.65,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0XFF28283A),
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
                                    .convertTime(weatherProvider
                                        .weatherDetails!.timezone!)
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
                                    '${weatherProvider.convertTemp(weatherProvider.weatherDetails!.main!.temp!).toStringAsFixed(0)}°C',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: widthX * 0.17),
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        'Feels Like',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: widthX * 0.02,
                                      ),
                                      Text(
                                        '${weatherProvider.convertTemp(weatherProvider.weatherDetails!.main!.feelsLike!).toStringAsFixed(0)} °C',
                                        style: const TextStyle(
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
                                decoration: const BoxDecoration(
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
                              CustomContainer(
                                icon: Icons.wind_power,
                                text: 'Wind',
                                value:
                                    '${weatherProvider.convertWind(weatherProvider.weatherDetails!.wind!.speed!).toStringAsFixed(2)} km/h',
                              ),
                              SizedBox(
                                width: widthX * 0.025,
                              ),
                              CustomContainer(
                                icon: Icons.sunny,
                                text: 'Max',
                                value:
                                    '${weatherProvider.convertTemp(weatherProvider.weatherDetails!.main!.tempMax!)} °C',
                              ),
                              SizedBox(
                                width: widthX * 0.025,
                              ),
                              CustomContainer(
                                icon: Icons.sunny_snowing,
                                text: 'Min',
                                value:
                                '${weatherProvider.convertTemp(weatherProvider.weatherDetails!.main!.tempMin!)} °C',
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: heightX * 0.025),
                            child: Row(
                              children: [
                                CustomContainer(
                                  icon: Icons.bar_chart,
                                  text: 'Sea Level',
                                  value:
                                  '${weatherProvider.weatherDetails!.main!.seaLevel!.toDouble().toStringAsFixed(0)} m',
                                ),
                                SizedBox(
                                  width: widthX * 0.025,
                                ),
                                CustomContainer(
                                  icon: Icons.thermostat,
                                  text: 'Pressure',
                                  value:
                                  '${weatherProvider.weatherDetails!.main!.pressure!} Mb',
                                ),
                                SizedBox(
                                  width: widthX * 0.025,
                                ),
                                CustomContainer(
                                  icon: Icons.water_drop,
                                  text: 'Humidity',
                                  value:
                                  '${weatherProvider.weatherDetails!.main!.humidity!} %',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                  child: Container(
                    height: heightX * 0.2,
                    decoration: BoxDecoration(
                      color: const Color(0XFF28283A),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 18.0, right: 18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.brightness_3_outlined,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                  Text(
                                    'Sunset',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.brightness_6_outlined,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                  Text(
                                    'Sunrise',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(18.0),
                          child: Divider(
                            height: 2,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 18.0, right: 18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                weatherProvider
                                    .convertSTime(weatherProvider
                                        .weatherDetails!.sys!.sunset!)
                                    .toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              Text(
                                weatherProvider
                                    .convertSTime(weatherProvider
                                        .weatherDetails!.sys!.sunrise!)
                                    .toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
