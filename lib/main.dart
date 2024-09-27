import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(const DivineBlissApp());
}

class DivineBlissApp extends StatefulWidget {
  const DivineBlissApp({super.key});

  @override
  _DivineBlissAppState createState() => _DivineBlissAppState();
}

class _DivineBlissAppState extends State<DivineBlissApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void _toggleTheme(ThemeMode mode) {
    setState(() {
      _themeMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DIVINE BLISS',
      theme: ThemeData(
        primaryColor: Colors.red,
        brightness: Brightness.light,
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          bodyMedium: TextStyle(
            fontSize: 18.0,
            color: Colors.black,
          ),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.red,
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          bodyMedium: TextStyle(
            fontSize: 18.0,
            color: Colors.white,
          ),
        ),
      ),
      themeMode: _themeMode,
      home: HomeScreen(onThemeChange: _toggleTheme),
    );
  }
}
