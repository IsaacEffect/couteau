import 'dart:convert';
import 'package:http/http.dart' as http;

class WordpressService {

  static Future<List> getPosts() async {

    final response = await http.get(
        Uri.parse("https://es.rollingstone.com/wp-json/wp/v2/posts?per_page=3")
    );

    return json.decode(response.body);

  }

}