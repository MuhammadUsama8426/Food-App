import 'package:flutter/material.dart';

import '../../core/app_export.dart';

class AppbarTrailingImage extends StatelessWidget {
  const AppbarTrailingImage({
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
    return InkWell(
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomImageView(
          imagePath: imagePath!,
          height: 44.0,
          width: 44.0,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
