part of 'weather_bloc.dart';

sealed class WeatherEvent {}

class WeatherRequested extends WeatherEvent {}
