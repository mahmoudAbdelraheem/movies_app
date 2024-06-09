import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';

final ThemeData appTheme = ThemeData.dark(
  useMaterial3: false,
).copyWith(
  scaffoldBackgroundColor: AppColors.primaryColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.appBarColor,
  ),
);
