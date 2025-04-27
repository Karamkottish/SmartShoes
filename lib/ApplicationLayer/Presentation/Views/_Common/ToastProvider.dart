import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/_Resources/ColorManager.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/_Resources/ValueManager.dart';

enum GeneralStates { pending, failed, success }

final toastProvider = Provider.family.autoDispose((ref, BuildContext context) {
  final myToast = Toaster(context);
  myToast.init();
  return myToast;
});

class Toaster {
  BuildContext context;
  final myToast = FToast();

  Toaster(this.context);

  void init() {
    myToast.init(context);
  }

  void show({required AsyncValue state, String? message}) {
    Color containerColor = Colors.black38;
    Color textColor = Colors.white;
    int seconds = 60;
    String m = message?? "Loading";
    CircularProgressIndicator? indicator;
    SizedBox? sizedBox;


    switch (state.runtimeType) {
      case const (AsyncLoading<String>):
        print("inside loading");
        indicator = const CircularProgressIndicator();
        sizedBox = const SizedBox(width: AppSizeManager.s20);
        break;
      case const (AsyncError<String>):
        print("inside errror");
        containerColor = ColorManager.errorContainer;
        seconds = 10;
        m = message?? state.error.toString();
        break;
      case const (AsyncData<String>):
        print("inside data");
        containerColor = ColorManager.inversePrimary;
        textColor = Colors.black;
        m = message?? state.value.toString();
        seconds = 4;
    }
    removeToast();
    myToast.showToast(
        toastDuration: Duration(seconds: seconds),
        child: Container(
          decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(AppSizeManager.s20),
          ),
          padding: const EdgeInsets.symmetric(
              horizontal: AppPaddingManager.p18,
              vertical: AppPaddingManager.p12),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            if (indicator != null) indicator,
            if (sizedBox != null) sizedBox,
            Flexible(child: Text(m, style: TextStyle(color: textColor)))
          ]),
        ));
  }

  void removeToast() => myToast.removeQueuedCustomToasts();
}
