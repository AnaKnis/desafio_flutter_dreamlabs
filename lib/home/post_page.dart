import 'package:desafio_flutter_dreamlabs/core/app_colors.dart';
import 'package:flutter/material.dart';

class PostPage extends StatelessWidget {
  final String title;
  final String body;

  const PostPage({Key? key, required this.title, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.SteelBlue,
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Wrap(
          runSpacing: 20.0,
          children: [
            Text(
              '$title',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '$body',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
