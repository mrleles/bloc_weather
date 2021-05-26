import 'package:bloc_weather/models/weather.dart';
import 'package:bloc_weather/repositories/weather_api_client.dart';

class WeatherRepository {
  final WeatherApiClient weatherApiClient;

  WeatherRepository({
    required this.weatherApiClient,
  });

  Future<Weather> getWeather(String city) async {
    final int locationId = await weatherApiClient.getLocationId(city);
    return weatherApiClient.fetchWeather(locationId);
  }
}
