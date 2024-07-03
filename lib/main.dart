import 'package:flutter/material.dart';
import 'package:movies_app/auth/presentation/screens/signin_screen.dart';
import 'package:movies_app/auth/presentation/screens/signup_screen.dart';
import 'package:movies_app/core/services/service_locator.dart';
import 'package:movies_app/core/utils/app_theme.dart';
import 'package:movies_app/router.dart';

Future<void> main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator().init();
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
      // onGenerateRoute: (setting) => generateRoute(setting),
      home: SignupScreen(),
    );
  }
}
