import 'package:flutter/material.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/_Resources/ColorManager.dart';

enum CircleContainerStateColor {
  critical(ColorManager.onSurfaceVariant4LRedOpacity),
  serious(ColorManager.onSurfaceVariant3LYellowOpacity),
  stable(ColorManager.onSurfaceVariant2LGreenOpacity);

  const CircleContainerStateColor(this.containerColor);

  final Color containerColor;
}
