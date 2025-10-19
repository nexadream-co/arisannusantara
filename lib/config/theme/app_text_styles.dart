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

  final TextStyle header = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors().textPrimary,
  );

  final TextStyle title = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors().textPrimary,
  );

  final TextStyle subtitle = TextStyle(
    fontSize: 12,
    color: AppColors().textSecondary,
  );

  final TextStyle body = TextStyle(
    fontSize: 12,
    color: AppColors().textPrimary,
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

  final TextStyle subtitleSmall = TextStyle(
    fontSize: 10,
    color: AppColors().textSecondary,
  );

  final TextStyle bodySmall = TextStyle(
    fontSize: 10,
    color: AppColors().textPrimary,
  );
}
