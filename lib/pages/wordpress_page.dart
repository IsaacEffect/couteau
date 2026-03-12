import 'package:flutter/material.dart';
import '../services/wordpress_service.dart';
import 'package:url_launcher/url_launcher.dart';

class WordpressPage extends StatefulWidget {
  const WordpressPage({super.key});

  @override
  State<WordpressPage> createState() => _WordpressPageState();
}

class _WordpressPageState extends State<WordpressPage> {

  List posts = [];

  @override
  void initState() {
    cargar();
    super.initState();
  }

  Future<void> cargar() async {

    final data = await WordpressService.getPosts();

    setState(() {
      posts = data;
    });

  }

  // ignore: strict_top_level_inference
  Future<void> abrir(url) async {

    final uri = Uri.parse(url);

    await launchUrl(uri);

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Noticias")),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context,index){

          final post = posts[index];

          return ListTile(
            title: Text(post["title"]["rendered"]),
            subtitle: Text("Ver noticia"),
            onTap: (){
              abrir(post["link"]);
            },
          );

        },
      ),
    );
  }
}