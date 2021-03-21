import 'package:flutter/material.dart';
import 'package:http_request/screen/gallery_screen.dart';
import 'package:http_request/screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class RouteArgument {
  final String title;
  RouteArgument({this.title});
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
