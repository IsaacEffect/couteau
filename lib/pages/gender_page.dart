import 'package:flutter/material.dart';
import '../services/gender_service.dart';

class GenderPage extends StatefulWidget {
  @override
  State<GenderPage> createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {

  TextEditingController controller = TextEditingController();
  String? gender;

  buscar() async {

    final result = await GenderService.getGender(controller.text);

    setState(() {
      gender = result;
    });

  }

  @override
  Widget build(BuildContext context) {

    Color fondo = Colors.grey;

    if(gender=="male"){
      fondo = Colors.blue;
    }

    if(gender=="female"){
      fondo = Colors.pink;
    }

    return Scaffold(
      appBar: AppBar(title: Text("Predecir Género")),
      body: Container(
        color: fondo,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [

            TextField(
              controller: controller,
              decoration: InputDecoration(
                  labelText: "Nombre"
              ),
            ),

            SizedBox(height:20),

            ElevatedButton(
                onPressed: buscar,
                child: Text("Predecir")
            ),

            SizedBox(height:20),

            Text(
                gender ?? "Sin resultado",
                style: TextStyle(fontSize:22)
            )

          ],
        ),
      ),
    );
  }
}