import 'package:flutter/material.dart';
import 'package:movies_app/core/services/service_locator.dart';
import 'package:movies_app/movies/presentation/screens/movies_screen.dart';

void main() {
  ServiceLocator().init();
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App using BloC',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: const MoviesScreen(),
    );
  }
}
