import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../core/app_export.dart';

// ignore_for_file: must_be_immutable

class CustomRatingBar extends StatelessWidget {
  const CustomRatingBar({
    super.key,
    this.alignment,
    this.ignoreGestures,
    this.initialRating,
    this.itemSize,
    this.itemCount,
    this.color,
    this.unselectedColor,
    this.onRatingUpdate,
  });

  final Alignment? alignment;
  final bool? ignoreGestures;
  final double? initialRating;
  final double? itemSize;
  final int? itemCount;
  final Color? color;
  final Color? unselectedColor;
  final Function(double)? onRatingUpdate;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: ratingBarWidget,
          )
        : ratingBarWidget;
  }

  Widget get ratingBarWidget => RatingBar.builder(
        ignoreGestures: ignoreGestures ?? false,
        initialRating: initialRating ?? 0,
        minRating: 0,
        direction: Axis.horizontal,
        allowHalfRating: false,
        itemSize: itemSize ?? 32.0, // Adjusted to a default value of 32.0
        unratedColor: unselectedColor,
        itemCount: itemCount ?? 5, // Adjusted to a default value of 5
        updateOnDrag: true,
        itemBuilder: (context, index) {
          return Icon(
            Icons.star,
            color: color ?? appTheme.yellow80001,
          );
        },
        onRatingUpdate: (rating) {
          onRatingUpdate?.call(rating); // Added null check
        },
      );
}
