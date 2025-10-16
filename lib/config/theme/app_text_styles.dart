import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  final TextStyle headline1 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors().textPrimary,
  );

  final TextStyle headline2 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors().textPrimary,
  );

  final TextStyle title = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors().textPrimary,
  );

  final TextStyle body = TextStyle(
    fontSize: 12,
    color: AppColors().textSecondary,
  );

  final TextStyle caption = TextStyle(
    fontSize: 12,
    color: AppColors().textDisabled,
  );

  final TextStyle button = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}
