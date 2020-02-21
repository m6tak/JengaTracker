import 'package:flutter/material.dart';
import 'package:jenga/views/home/home_page_view.dart';

import 'data/color_scheme.dart';


class JengaApp extends StatelessWidget{

  String get title => "JENGA";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Jenga!",
      theme: ThemeData(
        backgroundColor: JengaColorScheme.primaryDark,
        appBarTheme: AppBarTheme(
          color: JengaColorScheme.primaryOrange,
          elevation: 20.0
        )
      ),
      home: JengaHomePage(title: title),
    );
  }
}