import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';

class WeatherService {
  final String baseUrl = "https://api.openweathermap.org/data/2.5/weather";

  final String apiKey = "d042f0eea308123445727d0c452495d9";

  Future<WeatherModel?> fetchWeather(String city) async {
    final url = Uri.parse("$baseUrl?q=$city&appid=$apiKey&units=metric&lang=es");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return WeatherModel.fromJson(jsonData);
    } else {
      return null;
    }
  }
}
