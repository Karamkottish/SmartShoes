import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/Views/Feet/FeetView.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/Views/Graph/GraphView.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/Views/Home/HomeView.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/Views/Profile/ProfileView.dart';

final navigationViewProvider =
    StateNotifierProvider<NavigationViewModel, Widget>(
        (ref) => NavigationViewModel());

enum Views { homeView, feetView, graphView, editProfileView }

class NavigationViewModel extends StateNotifier<Widget> {
  Views currentView;

  NavigationViewModel({this.currentView = Views.homeView})
      : super(const HomeView());

  void setCurrentView() {
    print("entered NavigationViewModel");
    switch (currentView) {
      case Views.homeView:
        state = const HomeView();
        break;
      case Views.feetView:
        state = const FeetView();
        break;
      case Views.graphView:
        state = const GraphView();
        break;
      case Views.editProfileView:
        state = const ProfileView1();
        break;
    }
  }

  int get getCurrentIndex => currentView.index;

  void getSelectedView(int viewNum) {
    currentView = Views.values.elementAt(viewNum);
    setCurrentView();
  }

  void setSelectedViewIcon() {}
}
