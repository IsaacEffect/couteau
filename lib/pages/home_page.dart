import 'package:flutter/material.dart';
import 'toolbox_page.dart';
import 'gender_page.dart';
import 'age_page.dart';
import 'university_page.dart';
import 'weather_page.dart';
import 'pokemon_page.dart';
import 'wordpress_page.dart';
import 'about_page.dart';

class HomePage extends StatelessWidget {
  Widget boton(BuildContext context, String texto, Widget page) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => page));
        },
        child: Text(texto),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("App Multi Herramientas")),
      body: ListView(
        children: [
          boton(context, "Caja de Herramientas", ToolboxPage()),
          boton(context, "Predecir Género", GenderPage()),
          boton(context, "Predecir Edad", AgePage()),
          boton(context, "Universidades por País", UniversityPage()),
          boton(context, "Clima RD", WeatherPage()),
          boton(context, "Pokemon", PokemonPage()),
          boton(context, "Noticias WordPress", WordpressPage()),
          boton(context, "Acerca de", AboutPage()),
        ],
      ),
    );
  }
}
