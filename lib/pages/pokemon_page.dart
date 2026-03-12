import 'package:flutter/material.dart';
import '../services/pokemon_service.dart';

class PokemonPage extends StatefulWidget {
  const PokemonPage({super.key});

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {

  TextEditingController controller = TextEditingController();

  String? image;
  int? exp;

  Future<void> buscar() async {

    final data = await PokemonService.getPokemon(controller.text);

    setState(() {
      image = data["sprites"]["front_default"];
      exp = data["base_experience"];
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Pokemon")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [

            TextField(
              controller: controller,
              decoration: InputDecoration(labelText: "Pokemon"),
            ),

            ElevatedButton(
                onPressed: buscar,
                child: Text("Buscar")
            ),

            SizedBox(height:20),

            if(image!=null)
              Image.network(image!,height:120),

            Text("Experiencia: ${exp ?? ""}")

          ],
        ),
      ),
    );
  }
}