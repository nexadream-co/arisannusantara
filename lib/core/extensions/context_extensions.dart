import 'package:flutter/material.dart';

import '../../config/app_config.dart';
import '../../config/constants/app_assets.dart';
import '../../config/constants/app_endpoints.dart';
import '../../config/constants/app_strings.dart';
import '../../config/theme/app_colors.dart';
import '../../config/theme/app_radius.dart';
import '../../config/theme/app_shadow.dart';
import '../../config/theme/app_size.dart';
import '../../config/theme/app_spacing.dart';
import '../../config/theme/app_text_styles.dart';

extension AppContextExtensions on BuildContext {
  AppColors get colors => AppConfig.colors;
  AppTextStyles get textStyles => AppConfig.textStyles;
  AppSpacing get spacing => AppConfig.spacing;
  AppRadius get radius => AppConfig.radius;
  AppStrings get strings => AppConfig.strings;
  AppSize get appSize => AppConfig.appSize;
  AppAssets get assets => AppConfig.assets;
  AppEndpoints get endpoints => AppConfig.endpoints;
  AppShadow get shadow => AppConfig.shadow;
}

extension ScreenContextExtensions on BuildContext {
  // ignore: library_private_types_in_public_api
  _ScreenSize get screen => _ScreenSize(this);
}

class _ScreenSize {
  final BuildContext context;
  const _ScreenSize(this.context);

  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;
}
