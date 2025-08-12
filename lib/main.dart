import 'package:flutter/material.dart';
import 'package:flutter_application_2/screen/login.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 71, 71, 71),
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      title: 'Aplikasi Iuran Warga',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
