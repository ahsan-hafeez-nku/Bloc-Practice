import 'dart:convert';

import 'package:flutter_bloc_tut/features/weather/data/data_provider/weather_data_provider.dart';
import 'package:flutter_bloc_tut/model/weather_model.dart';

class WeatherRepository {
  final WeatherDataProvider weatherDataProvider;
  WeatherRepository(this.weatherDataProvider);

  Future<WeatherModel> getCurrentWeather() async {
    final rawResponse = await weatherDataProvider.getCurrentWeather('Lahore');
    final data = jsonDecode(rawResponse);

    if (data['cod'] != '200') {
      throw 'An unexpected error occurred';
    }

    return WeatherModel.fromMap(data);
  }
}
