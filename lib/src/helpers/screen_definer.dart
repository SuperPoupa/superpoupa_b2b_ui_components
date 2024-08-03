import 'package:flutter/material.dart';
import 'package:superpoupa_b2b_ui_components/src/helpers/enums.dart';

/// This class aims to identify the type of screen through its width, making it
/// possible to display responsive content.

class ScreenDefiner {
  static ScreenSize define(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    if (width < 600) {
      return ScreenSize.small;
    } else if (width < 900) {
      return ScreenSize.medium;
    } else if (width < 1200) {
      return ScreenSize.large;
    } else {
      return ScreenSize.xlarge;
    }
  }
}