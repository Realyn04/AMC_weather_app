import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/weather.dart';
import '../services/weather_service.dart';

class WeatherService {
  static const String apiKey = '59dab306e484c6191372d36b02f9073d';
  static const String basedUrl =
      'https://api.openweathermap.org/data/2.5/weather';

  static Future<Weather> getWeather(String cityName) async {
    try {
      final String url = '$basedUrl?q=$cityName&appid=$apiKey&units=metric';

      final http.Response response = await http.get(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return Weather.fromJson(data);
      } else if (response.statusCode == 404) {
        throw Exception('City not found');
      } else {
        throw Exception('Failed to fetch weather data');
      }
    } catch (e) {
      throw Exception('Failed to fetch weather data: $e');
    }
  }
}
