import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomScreenTitle extends StatelessWidget {
  final String title;
  const CustomScreenTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 40),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: GoogleFonts.robotoMono(
          fontSize: 33,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
