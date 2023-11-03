import 'dart:convert';
import 'package:flutter/material.dart';

void main() {
  runApp(WeatherAppLive());
}

class WeatherData {
  final String city, condition;
  final double temperature, windSpeed;
  final int humidity;

  WeatherData(
      {required this.city,
        required this.condition,
        required this.temperature,
        required this.windSpeed,
        required this.humidity,
      });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      city: json['city'],
      temperature: json['temperature'].toDouble(),
      condition: json['condition'],
      humidity: json['humidity'],
      windSpeed: json['windSpeed'].toDouble(),
    );
  }
}

class WeatherAppLive extends StatefulWidget {
  @override
  _WeatherAppLiveState createState() => _WeatherAppLiveState();
}

class _WeatherAppLiveState extends State<WeatherAppLive> {
  List<WeatherData> weatherDataList = [];

  @override
  void initState() {
    super.initState();
    String jsonString = '''
      [
        {
          "city": "New York",
          "temperature": 20,
          "condition": "Clear",
          "humidity": 60,
          "windSpeed": 5.5
        },
        {
          "city": "Los Angeles",
          "temperature": 25,
          "condition": "Sunny",
          "humidity": 50,
          "windSpeed": 6.8
        },
        {
          "city": "London",
          "temperature": 15,
          "condition": "Partly Cloudy",
          "humidity": 70,
          "windSpeed": 4.2
        },
        {
          "city": "Tokyo",
          "temperature": 28,
          "condition": "Rainy",
          "humidity": 75,
          "windSpeed": 8.0
        },
        {
          "city": "Sydney",
          "temperature": 22,
          "condition": "Cloudy",
          "humidity": 55,
          "windSpeed": 7.3
        }
      ]
    ''';
    
    List<dynamic> jsonList = json.decode(jsonString);
    for (Map<String, dynamic> jsonData in jsonList) {
      WeatherData weatherData = WeatherData.fromJson(jsonData);
      weatherDataList.add(weatherData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather Info APP'),
        ),
        body: ListView.builder(
          itemCount: weatherDataList.length,
          itemBuilder: (context, index) {
            WeatherData data = weatherDataList[index];
            return ListTile(
              title: Text('City: ${data.city}',
                  style: const TextStyle(fontSize: 18)
            ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Temperature: ${data.temperature}°C',
                      style: const TextStyle(fontSize: 16)),
                  Text('Condition: ${data.condition}',
                      style: const TextStyle(fontSize: 16)),
                  Text('Humidity: ${data.humidity}%',
                      style: const TextStyle(fontSize: 16)),
                  Text('Wind Speed: ${data.windSpeed} m/s',
                      style: const TextStyle(fontSize: 16)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
