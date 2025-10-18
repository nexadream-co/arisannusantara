import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';
import 'app_radius.dart';
import 'app_spacing.dart';
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
    textTheme: GoogleFonts.latoTextTheme(
      TextTheme(
        displayLarge: AppTextStyles().headline1,
        displayMedium: AppTextStyles().headline2,
        bodyLarge: AppTextStyles().body,
        bodyMedium: AppTextStyles().caption,
        labelLarge: AppTextStyles().button,
      ),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: AppTextStyles().title,
      iconTheme: IconThemeData(color: AppColors().textPrimary),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: AppSpacing().md),
        foregroundColor: AppColors().primary,
        side: BorderSide(color: AppColors().primary, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius().medium),
        ),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: AppSpacing().md),
        backgroundColor: AppColors().primary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius().medium),
        ),
      ),
    ),
    dividerColor: AppColors().divider,
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius().small),
      ),
      side: const BorderSide(width: 1.5, color: Colors.grey),
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors().primary;
        }
        return Colors.white;
      }),
      checkColor: WidgetStateProperty.all(Colors.white),
    ),
  );
}
