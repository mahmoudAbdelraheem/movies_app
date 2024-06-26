import 'package:flutter/material.dart';
import 'package:movies_app/core/services/service_locator.dart';
import 'package:movies_app/core/utils/app_theme.dart';
import 'package:movies_app/router.dart';

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
      theme: appTheme,
      onGenerateRoute: (setting) => generateRoute(setting),
    );
  }
}
