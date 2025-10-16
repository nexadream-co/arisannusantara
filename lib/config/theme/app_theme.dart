import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_radius.dart';
import 'app_text_styles.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors().primary,
    scaffoldBackgroundColor: AppColors().background,
    colorScheme: ColorScheme.light(
      primary: AppColors().primary,
      secondary: AppColors().secondary,
      error: AppColors().error,
    ),
    textTheme: TextTheme(
      displayLarge: AppTextStyles().headline1,
      displayMedium: AppTextStyles().headline2,
      bodyLarge: AppTextStyles().body,
      bodyMedium: AppTextStyles().caption,
      labelLarge: AppTextStyles().button,
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors().surface,
      titleTextStyle: AppTextStyles().headline2,
      iconTheme: IconThemeData(color: AppColors().textPrimary),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors().primary,
        side: BorderSide(color: AppColors().primary, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius().medium),
        ),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors().primary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius().medium),
        ),
      ),
    ),
    dividerColor: AppColors().divider,
  );
}
