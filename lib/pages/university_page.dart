import 'package:flutter/material.dart';
import '../services/university_service.dart';

class UniversityPage extends StatefulWidget {
  const UniversityPage({super.key});

  @override
  State<UniversityPage> createState() => _UniversityPageState();
}

class _UniversityPageState extends State<UniversityPage> {

  TextEditingController controller = TextEditingController();
  List universidades = [];

  Future<void> buscar() async {

    final result = await UniversityService.getUniversities(controller.text);

    setState(() {
      universidades = result;
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Universidades")),
      body: Column(
        children: [

          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(labelText: "País en inglés"),
            ),
          ),

          ElevatedButton(
              onPressed: buscar,
              child: Text("Buscar")
          ),

          Expanded(
            child: ListView.builder(
                itemCount: universidades.length,
                itemBuilder: (context,index){

                  final uni = universidades[index];

                  return ListTile(
                    title: Text(uni["name"]),
                    subtitle: Text(uni["domains"][0]),
                  );

                }
            ),
          )

        ],
      ),
    );
  }
}