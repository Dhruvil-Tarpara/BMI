import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      initialRoute: "/",
      routes: {
        "/" : (context)=> const HomePage(),
      },
    ),
  );
}
