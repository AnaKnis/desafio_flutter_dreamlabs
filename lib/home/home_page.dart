import 'package:desafio_flutter_dreamlabs/api/post_api.dart';
import 'package:desafio_flutter_dreamlabs/core/app_colors.dart';
import 'package:desafio_flutter_dreamlabs/home/post_page.dart';
import 'package:desafio_flutter_dreamlabs/model/post.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Post>> futurePost;

  @override
  void initState() {
    futurePost = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.SteelBlue,
        centerTitle: true,
        title: Text("Desafio - Dreamlabs"),
      ),
      body: Container(
        child: Center(
          child: FutureBuilder<List<Post>>(
            future: futurePost,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Card(
                        child: Column(
                        children: [
                          ListTile(
                            title: Text(snapshot.data![index].title),
                            subtitle: Text(
                              snapshot.data![index].body,
                              textAlign: TextAlign.justify,
                            ),
                            contentPadding: const EdgeInsets.all(10.0),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PostPage(
                                    title: snapshot.data![index].title,
                                    body: snapshot.data![index].body,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}
