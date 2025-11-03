part of 'weather_bloc.dart';

sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherSuccess extends WeatherState {
  final WeatherModel weather;
  WeatherSuccess({required this.weather});
}

final class WeatherFailure extends WeatherState {
  final String errorMessage;
  WeatherFailure(this.errorMessage);
}

final class WeatherLoading extends WeatherState {}
