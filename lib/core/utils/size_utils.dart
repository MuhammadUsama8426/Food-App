import 'package:flutter/material.dart';

// These are the Viewport values of your Figma Design.
// These are used in the code as a reference to create your UI Responsively.
const num FIGMA_DESIGN_WIDTH = 375;
const num FIGMA_DESIGN_HEIGHT = 812;
const num FIGMA_DESIGN_STATUS_BAR = 0;

// Extension on `num` to provide responsive width, height, and font size calculations
extension ResponsiveExtension on num {
  double get width => SizeUtils.width;
  double get h => (this * width) / FIGMA_DESIGN_WIDTH;
  double get fSize => (this * width) / FIGMA_DESIGN_WIDTH;
}

// Extension on `double` to handle formatting and non-zero checks
extension FormatExtension on double {
  double toDoubleValue({int fractionDigits = 2}) {
    return double.parse(toStringAsFixed(fractionDigits));
  }

  double isNonZero({num defaultValue = 0.0}) {
    return this != 0 ? this : defaultValue.toDouble();
  }
}

// Enum to define the device types
enum DeviceType { mobile, tablet, desktop }

// Typedef for responsive builder function
typedef ResponsiveBuild = Widget Function(
    BuildContext context, Orientation orientation, DeviceType deviceType);

// Sizer Widget: This widget helps in building UI based on device's orientation and size
class Sizer extends StatelessWidget {
  const Sizer({super.key, required this.builder});

  /// Builds the widget whenever the orientation changes.
  final ResponsiveBuild builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeUtils.setScreenSize(constraints, orientation);
            return builder(context, orientation, SizeUtils.deviceType);
          },
        );
      },
    );
  }
}

// SizeUtils class for handling device dimensions and orientation
class SizeUtils {
  static BoxConstraints boxConstraints = const BoxConstraints();
  static Orientation orientation = Orientation.portrait;
  static DeviceType deviceType = DeviceType.mobile;
  static double height = FIGMA_DESIGN_HEIGHT.toDouble();
  static double width = FIGMA_DESIGN_WIDTH.toDouble();

  /// Sets the screen size based on orientation and constraints
  static void setScreenSize(
      BoxConstraints constraints, Orientation currentOrientation) {
    boxConstraints = constraints;
    orientation = currentOrientation;

    if (orientation == Orientation.portrait) {
      width = constraints.maxWidth.isNonZero(defaultValue: FIGMA_DESIGN_WIDTH);
      height =
          constraints.maxHeight.isNonZero(defaultValue: FIGMA_DESIGN_HEIGHT);
    } else {
      width = constraints.maxHeight.isNonZero(defaultValue: FIGMA_DESIGN_WIDTH);
      height =
          constraints.maxWidth.isNonZero(defaultValue: FIGMA_DESIGN_HEIGHT);
    }

    deviceType = width < 600 ? DeviceType.mobile : DeviceType.tablet;
  }
}
