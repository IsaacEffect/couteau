import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Acerca de")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            CircleAvatar(
              radius:60,
              backgroundImage: AssetImage(
                  "assets/mi_foto.jpg"
              ),
            ),

            SizedBox(height:20),

            Text(
              "Angel Isaac Mejia Martinez",
              style: TextStyle(fontSize:22),
            ),

            Text("Backend .NET Developer"),

            Text("isaacmartinez9875@gmail.com")

          ],
        ),
      ),
    );
  }
}