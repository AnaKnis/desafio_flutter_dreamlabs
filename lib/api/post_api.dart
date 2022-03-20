import 'dart:convert';
import 'dart:async';
import 'package:desafio_flutter_dreamlabs/model/post.dart';
import 'package:http/http.dart' as http;

Future<List<Post>> fetchPost() async {
  final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

  if (response.statusCode == 200){
    // se "ok" -> parse json
    List responseJson = json.decode(response.body);
    return responseJson.map((m) => new Post.fromJson(m)).toList();
  } else {
    // se não "ok" -> exception
    throw Exception("Falha ao carregar álbum");
  }
}

