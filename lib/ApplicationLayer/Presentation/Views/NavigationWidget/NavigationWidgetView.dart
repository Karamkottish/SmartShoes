
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/Views/Feet/FeetView.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/Views/NavigationWidget/NavigationViewModel.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/Views/Profile/ProfileView.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/_Resources/AssetsManager.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/_Resources/ColorManager.dart';


class NavigationView extends ConsumerWidget {
  const NavigationView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: ref.watch(navigationViewProvider),
        bottomNavigationBar: NavigationBarTheme(
          data: const NavigationBarThemeData(
              indicatorColor: ColorManager.primaryContainer, elevation: 0),
          child: NavigationBar(
            height: 50,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            elevation: 0,
            selectedIndex:
            ref.watch(navigationViewProvider.notifier).getCurrentIndex,
            onDestinationSelected: (int selected) => ref
                .read(navigationViewProvider.notifier)
                .getSelectedView(selected),
            destinations: [
              getBottomBarIcon("home", ImageAssetsManager.HomeEmpty,
                  ImageAssetsManager.HomeFiled),
              getBottomBarIcon("feet", ImageAssetsManager.FeetEmpty,
                  ImageAssetsManager.FeetFilled),
              getBottomBarIcon("graph", ImageAssetsManager.GraphEmpty,
                  ImageAssetsManager.GraphFilled),
              getBottomBarIcon("profile", ImageAssetsManager.ProfileEmpty,
                  ImageAssetsManager.ProfileFilled),
            ],
          ),
        ));
  }

  NavigationDestination getBottomBarIcon(
      String label, String emptyIcon, String filledIcon) =>
      NavigationDestination(
          label: label,
          icon:
          SizedBox(height: 25, child: Image(image: AssetImage(emptyIcon))),
          selectedIcon: SizedBox(
            height: 25,
            child: Image(image: AssetImage(filledIcon)),
          ));
}


class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  List<Widget> pages = [const HomeView(), const FeetView(), const ProfileView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(
            indicatorColor: ColorManager.primaryContainer, elevation: 0),
        child: NavigationBar(
          height: 50,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          elevation: 0,
          selectedIndex: currentIndex,
          onDestinationSelected: (int selected) =>
              setState(() => currentIndex = selected),
          destinations: [
            getBottomBarIcon("home", ImageAssetsManager.HomeEmpty,
                ImageAssetsManager.HomeFiled),
            getBottomBarIcon("feet", ImageAssetsManager.FeetEmpty,
                ImageAssetsManager.FeetFilled),
            getBottomBarIcon("profile", ImageAssetsManager.ProfileEmpty,
                ImageAssetsManager.ProfileFilled),
          ],
        ),
      ),
    );
  }

  NavigationDestination getBottomBarIcon(
          String label, String emptyIcon, String filledIcon) =>
      NavigationDestination(
          label: label,
          icon:
              SizedBox(height: 25, child: Image(image: AssetImage(emptyIcon))),
          selectedIcon: SizedBox(
            height: 25,
            child: Image(image: AssetImage(filledIcon)),
          ));
}
