import 'package:bloc_weather/blocs/blocs.dart';
import 'package:bloc_weather/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Weather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        title: Text('Bloc Weather'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              final city = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CitySelection(),
                ),
              );
              if (city != null) {
                BlocProvider.of<WeatherBloc>(context)
                    .add(WeatherRequested(city: city));
              }
            },
          )
        ],
      ),
      body: Center(
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherInitial) {
              return Center(
                child: Text(
                  'Please Select a Location',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              );
            }
            if (state is WeatherLoadInProgress) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is WeatherLoadSuccess) {
              final weather = state.weather;

              return ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 100.0, left: 20),
                    child: Location(location: weather.location),
                  ),
                  Center(
                    child: LastUpdated(dateTime: weather.lastUpdated),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 50.0,
                    ),
                    child: Center(
                      child: CombinedWeatherTemperature(weather: weather),
                    ),
                  ),
                ],
              );
            }
            if (state is WeatherLoadFailure) {
              return Text(
                'Something went wrong!',
                style: TextStyle(color: Colors.red),
              );
            }
            throw 'f**k you';
          },
        ),
      ),
    );
  }
}
