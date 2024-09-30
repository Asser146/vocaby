import 'package:flutter/material.dart';
import 'package:vocaby/core/theming/colors.dart';

class GradientBorderContainer extends StatelessWidget {
  const GradientBorderContainer({
    super.key,
    required this.child,
    required this.borderRadius,
    required this.edgeInsets,
  });
  final Widget child;
  final BorderRadius borderRadius;
  final EdgeInsets edgeInsets;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: ColorsManager.linearGradient, borderRadius: borderRadius),
      child: Padding(padding: edgeInsets, child: child),
    );
  }
}
