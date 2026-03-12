import 'package:flutter/material.dart';
import '../services/age_service.dart';

class AgePage extends StatefulWidget {
  @override
  State<AgePage> createState() => _AgePageState();
}

class _AgePageState extends State<AgePage> {

  TextEditingController controller = TextEditingController();
  int? age;

  buscar() async {

    final result = await AgeService.getAge(controller.text);

    setState(() {
      age = result;
    });

  }

  String estado(){

    if(age==null) return "";

    if(age! < 18) return "Joven";
    if(age! < 60) return "Adulto";

    return "Anciano";

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Predecir Edad")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [

            TextField(
              controller: controller,
              decoration: InputDecoration(labelText: "Nombre"),
            ),

            SizedBox(height:20),

            ElevatedButton(
                onPressed: buscar,
                child: Text("Predecir")
            ),

            SizedBox(height:20),

            Text("Edad: ${age ?? ""}"),

            Text(
                estado(),
                style: TextStyle(fontSize:22)
            )

          ],
        ),
      ),
    );
  }
}