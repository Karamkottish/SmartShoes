import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/Views/Home/SubViews/CircleIndicator/CircleIndicator.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/_Resources/StyleManager.dart';
import 'package:smart_shoes/Data/Providers/LegSensorsProviders.dart';
import 'package:smart_shoes/Domain/States/CircleState/CircleState.dart';

import '../../../../_Resources/ValueManager.dart';

class LegRowView extends StatelessWidget {
  final CircleState circle1;
  final CircleState circle2;
  final AssetImage image;
  final String desc;

  const LegRowView(
      {required this.circle1,
      required this.circle2,
      required this.image,
      required this.desc,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: [
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: Consumer(
            builder: (context, ref, child) => Container(
                decoration: BoxDecoration(
              color: ref
                  .watch(circleContainerColorProvider(
                      [circle1.circleEntity, circle2.circleEntity]))
                  .containerColor,
              borderRadius: BorderRadius.circular(AppSizeManager.s16),
            )),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: AppPaddingManager.p8, vertical: AppPaddingManager.p4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Align(

                child: ImageAndDesc(
                    image: image, desc: desc),
              ),
              CircleIndicator(circleEntity: circle1.circleEntity),
              CircleIndicator(circleEntity: circle2.circleEntity)
            ],
          ),
        )
      ],
    );
  }
}

class ImageAndDesc extends StatelessWidget {
  final AssetImage image;
  final String desc;

  const ImageAndDesc({required this.image, required this.desc, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Image(image: image),
      Text(desc, style: TextStyleManager.getBoldStyle())
    ]);
  }
}
