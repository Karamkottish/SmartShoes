import 'package:flutter/material.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/Views/Home/SubViews/MainContainers/LeftLegContainer.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/Views/Home/SubViews/MainContainers/RightLegContainer.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/_Resources/StringManager.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/_Resources/ColorManager.dart';


import '../../_Resources/ValueManager.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            title: const Text(StringManager.overAllView),
          )),
      backgroundColor: ColorManager.surface,
      body: const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: AppPaddingManager.p16, horizontal: AppPaddingManager.p8),
              child: RightLegContainer(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: AppPaddingManager.p16, horizontal: AppPaddingManager.p8),
              child: LeftLegContainer(),
            ),
          ],
        ),
      ));
}

