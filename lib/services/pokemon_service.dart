import 'dart:convert';
import 'package:http/http.dart' as http;

class PokemonService {

  static Future<Map> getPokemon(String name) async {

    final response = await http.get(
        Uri.parse("https://pokeapi.co/api/v2/pokemon/$name")
    );

    return json.decode(response.body);

  }

}