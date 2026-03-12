import 'package:flutter/material.dart';

class ToolboxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Caja de Herramientas"),
      ),
      body: Center(
        child: Image.network(
          "https://static.vecteezy.com/system/resources/thumbnails/053/812/368/small/3d-illustration-tool-box-with-hammer-and-wrench-png.png",
          height: 200,
        ),
      ),
    );
  }
}