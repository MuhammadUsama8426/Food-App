import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../custom_icon_button.dart';

class AppbarLeadingIconButton extends StatelessWidget {
  const AppbarLeadingIconButton({
    super.key,
    this.imagePath,
    this.margin,
    this.onTap,
  });

  final String? imagePath;
  final EdgeInsetsGeometry? margin;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomIconButton(
          height: 44.0,
          width: 44.0,
          padding: const EdgeInsets.all(14.0),
          child: CustomImageView(
            imagePath: imagePath ?? ImageConstant.imgVector,
          ),
        ),
      ),
    );
  }
}
