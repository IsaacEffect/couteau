import 'package:flutter/material.dart';
import '../services/weather_service.dart';

class WeatherPage extends StatefulWidget {
  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {

  double? temp;
  String? description;

  @override
  void initState() {
    cargarClima();
    super.initState();
  }

  cargarClima() async {

    final data = await WeatherService.getWeather();

    setState(() {
      temp = data["main"]["temp"];
      description = data["weather"][0]["description"];
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Clima en RD"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              "Santo Domingo",
              style: TextStyle(fontSize: 24),
            ),

            SizedBox(height:20),

            Text(
              "Temperatura: ${temp ?? "..."} °C",
              style: TextStyle(fontSize:22),
            ),

            SizedBox(height:10),

            Text(
              description ?? "",
              style: TextStyle(fontSize:18),
            )

          ],
        ),
      ),
    );
  }
}