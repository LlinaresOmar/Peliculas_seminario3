import 'package:flutter/material.dart';
import 'screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(appBarTheme: const AppBarTheme(color: Colors.indigo)),
      title: 'Películas',
      initialRoute: 'home_screen',
      routes: {
        'home_screen': (_) => HomeScreen(),
        'details_screen': (_) => DetailScreen(),
      },
    );
  }
}