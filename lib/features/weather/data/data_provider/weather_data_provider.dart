// import 'dart:developer';

import 'package:flutter_bloc_tut/features/weather/secret.dart';
import 'package:http/http.dart' as http;

class WeatherDataProvider {
  Future<String> getCurrentWeather(String cityName) async {
    String cityName = 'Lahore';
    try {
      final res = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherAPIKey',
        ),
      );
      // log("Weather Data Provider => ${res.body}");
      return res.body;
    } catch (e) {
      throw e.toString();
    }
  }
}
