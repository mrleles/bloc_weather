import 'package:bloc_weather/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:bloc_weather/widgets/widgets.dart';
import 'package:bloc_weather/repositories/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  final WeatherRepository weatherRepository;
  const App({
    Key? key,
    required this.weatherRepository,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Weather',
      home: BlocProvider(
        create: (context) => WeatherBloc(weatherRepository: weatherRepository),
        child: Weather(),
      ),
    );
  }
}
