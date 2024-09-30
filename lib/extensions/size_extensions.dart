import 'package:flutter/material.dart';

extension ResponsiveSize on num {
  double h(BuildContext context) {
    return this * MediaQuery.of(context).size.height / 100;
  }

  double w(BuildContext context) {
    return this * MediaQuery.of(context).size.width / 100;
  }
}
