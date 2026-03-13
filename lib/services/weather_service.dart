import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {

  static const apiKey = "aca va toquen su api key de openweathermap";

  static Future<Map> getWeather() async {

    final response = await http.get(
      Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=Santo%20Domingo,DO&appid=$apiKey&units=metric"
      )
    );

    return json.decode(response.body);

  }

}