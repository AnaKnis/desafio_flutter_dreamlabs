import 'package:desafio_flutter_dreamlabs/core/app_colors.dart';
import 'package:desafio_flutter_dreamlabs/home/home_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Desafio Dream Labs",
      theme: ThemeData(
        primaryColor: AppColors.SteelBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
