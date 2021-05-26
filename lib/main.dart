import 'package:bloc_weather/app.dart';
import 'package:bloc_weather/repositories/repositories.dart';
import 'package:bloc_weather/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();

  final WeatherRepository weatherRepository = WeatherRepository(
    weatherApiClient: WeatherApiClient(httpClient: Client()),
  );

  runApp(App(weatherRepository: weatherRepository));
}
