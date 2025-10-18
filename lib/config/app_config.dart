import 'constants/app_assets.dart';
import 'constants/app_endpoints.dart';
import 'constants/app_strings.dart';
import 'theme/app_colors.dart';
import 'theme/app_radius.dart';
import 'theme/app_shadow.dart';
import 'theme/app_size.dart';
import 'theme/app_spacing.dart';
import 'theme/app_text_styles.dart';

class AppConfig {
  static final colors = AppColors();
  static final textStyles = AppTextStyles();
  static final spacing = AppSpacing();
  static final appSize = AppSize();
  static final radius = AppRadius();
  static final strings = AppStrings();
  static final assets = AppAssets();
  static final endpoints = AppEndpoints();
  static final shadow = AppShadow();
}
