import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';

class MovieDataBackground extends StatelessWidget {
  const MovieDataBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
