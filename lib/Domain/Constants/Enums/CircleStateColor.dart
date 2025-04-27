import 'package:flutter/material.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/_Resources/ColorManager.dart';

enum CircleStateColor {
  critical(
      lightColor: ColorManager.onSurfaceVariant4LRed,
      dartColor: ColorManager.onSurfaceVariant4DRed),
  serious(
      lightColor: ColorManager.onSurfaceVariant3LYellow,
      dartColor: ColorManager.onSurfaceVariant3DYellow),
  stable(
      lightColor: ColorManager.onSurfaceVariant2LGreen,
      dartColor: ColorManager.onSurfaceVariant2DGreen);

  const CircleStateColor({required this.lightColor, required this.dartColor});

  final Color lightColor;
  final Color dartColor;
}
