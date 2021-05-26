import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:bloc_weather/models/weather.dart';
import 'package:bloc_weather/repositories/repositories.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherBloc({
    required this.weatherRepository,
  }) : super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is WeatherRequested) {
      yield WeatherLoadInProgress();
      try {
        final Weather weather = await weatherRepository.getWeather(event.city);
        yield WeatherLoadSuccess(weather: weather);
      } catch (e) {
        print('ERRO: ${e.toString()}');
        yield WeatherLoadFailure();
      }
    }
  }
}
