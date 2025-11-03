import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tut/features/weather/data/repository/weather_repository.dart';
import 'package:flutter_bloc_tut/model/weather_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherBloc(this.weatherRepository) : super(WeatherInitial()) {
    on<WeatherRequested>(_onWeatherRequested);
  }

  void _onWeatherRequested(
    WeatherRequested event,
    Emitter<WeatherState> emit,
  ) async {
    emit(WeatherLoading());
    try {
      final weather = await weatherRepository.getCurrentWeather();
      emit(WeatherSuccess(weather: weather));
    } catch (e) {
      emit(WeatherFailure(e.toString()));
    }
  }
}
