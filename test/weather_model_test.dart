import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/models/weather.dart';

void main() {
  group('Weather Model Test', () {
    test('should return a valid Weather model from a Manila API sample', () {
      // 1. Arrange: Create a realistic JSON sample for Manila from OpenWeatherMap
      final Map<String, dynamic> jsonMap = {
        "coord": {"lon": 120.9822, "lat": 14.5995},
        "weather": [
          {
            "id": 803,
            "main": "Clouds",
            "description": "broken clouds",
            "icon": "04d",
          },
        ],
        "base": "stations",
        "main": {
          "temp": 31.5,
          "feels_like": 35.2,
          "temp_min": 30.0,
          "temp_max": 33.0,
          "pressure": 1010,
          "humidity": 65,
        },
        "visibility": 10000,
        "wind": {"speed": 3.6, "deg": 240},
        "clouds": {"all": 75},
        "dt": 1705123200,
        "sys": {
          "type": 1,
          "id": 7905,
          "country": "PH",
          "sunrise": 1705098245,
          "sunset": 1705139210,
        },
        "timezone": 28800,
        "id": 1701668,
        "name": "Manila",
        "cod": 200,
      };

      // 2. Act: Simulate real JSON decoding
      var Weather;
      final weather = Weather.fromJson(json.decode(json.encode(jsonMap)));

      // 3. Assert: Check if the fields are correctly parsed
      expect(weather.cityName, 'Manila');
      expect(weather.temperature, 31.5);
      expect(weather.mainCondition, 'Clouds');
    });
  });
}
