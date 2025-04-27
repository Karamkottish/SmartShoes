import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/_Resources/StyleManager.dart';
import 'package:smart_shoes/Data/Providers/LegSensorsProviders.dart';
import 'package:smart_shoes/Domain/States/CircleState/CircleEntity.dart';

import '../../../../_Resources/ValueManager.dart';

class CircleIndicator extends StatelessWidget {
  final CircleEntity circleEntity;

  const CircleIndicator({
    required this.circleEntity,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Consumer(
          builder: (context, ref, child) => CircularPercentIndicator(
                radius: AppSizeManager.s40,
                lineWidth: AppSizeManager.s2,
                progressColor: ref.watch(circleControllerProvider(circleEntity)
                    .select((value) => value.circleStateColor.dartColor)),
                backgroundColor: Colors.transparent,
                percent: 1,
                animation: false,
              )),
      Consumer(
          builder: (context, ref, child) => CircularPercentIndicator(
                radius: AppSizeManager.s32,
                progressColor: ref.watch(circleControllerProvider(circleEntity)
                    .select((value) => value.circleStateColor.lightColor)),
                backgroundColor: Colors.transparent,
                animation: true,
                animateFromLastPercent: true,
                animationDuration: 500,
                percent: ref.watch(circleControllerProvider(circleEntity)
                    .select((value) => value.circleEntity.percentage / 100)),
              )),
      Column(
        children: [upperText(), middleText(), bottomText()],
      )
    ]);
  }

  Consumer upperText() => Consumer(builder: (context, ref, child) {
        print("rebuilt upper Text");
        return Text(
          ref.watch<String>(circleControllerProvider(circleEntity)
              .select((value) => value.circleEntity.unit.type)),

          style: TextStyleManager.getBoldStyle(
              color: ref.watch(circleControllerProvider(circleEntity)
                  .select((value) => value.circleStateColor.dartColor))),
        );
      });

  Consumer middleText() => Consumer(builder: (context, ref, child) {
        print("rebuilt middle Text");
        int percent =
            ref.watch(circleControllerProvider(circleEntity)).circleEntity.percentage;
        String unit =
            ref.watch(circleControllerProvider(circleEntity)).circleEntity.unit.unit;
        return Text("$percent $unit",
            style: TextStyleManager.getBoldStyle(
                color: ref.watch(circleControllerProvider(circleEntity)
                    .select((value) => value.circleStateColor.dartColor))));
      });

  Consumer bottomText() => Consumer(builder: (context, ref, child) {
        print("rebuilt bottom Text");
        return Text(
            ref.watch(circleControllerProvider(circleEntity)
                .select((value) => value.circleStateColor.name)),
            style: TextStyleManager.getBoldStyle(
                color: ref.watch(circleControllerProvider(circleEntity)
                    .select((value) => value.circleStateColor.dartColor))));
      });
}
