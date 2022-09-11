import 'package:flutter/material.dart';
import 'Screen/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xff0a0321),
        primaryColor: Colors.pink,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: false,
          color: Color(0xff0a0321),
        ),
      ),
      home: const Home(),
    );
  }
}
  