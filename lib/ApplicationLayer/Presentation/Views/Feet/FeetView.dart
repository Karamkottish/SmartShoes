import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/_Resources/AssetsManager.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/_Resources/ColorManager.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/_Resources/FontManager.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/_Resources/StyleManager.dart';

class FeetView extends StatefulWidget {
  const FeetView({Key? key}) : super(key: key);

  @override
  State<FeetView> createState() => _FeetViewState();
}

class _FeetViewState extends State<FeetView> {
  Image foot = const Image(image: AssetImage(ImageAssetsManager.FootSensors));
  StreamController<Map<String, dynamic>> feetStreamController =
      StreamController();

  void calcVals() async {
    List<int> sensorsVals = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    Timer.periodic(const Duration(seconds: 2), (_) {
      for (var i = 0; i < sensorsVals.length; ++i) {
        sensorsVals[i] = Random().nextInt(300);
      }

      feetStreamController.sink.add({
        "R11": sensorsVals[0],
        "R12": sensorsVals[1],
        "R13": sensorsVals[2],
        "R14": sensorsVals[3],
        "R21": sensorsVals[4],
        "R22": sensorsVals[5],
        "R23": sensorsVals[6],
        "R24": sensorsVals[7],
        "R25": sensorsVals[8],
        "R26": sensorsVals[9],
        "R31": sensorsVals[10],
        "R32": sensorsVals[11],
      });
    });
  }

  @override
  void initState() {
    super.initState();
    calcVals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: AppBar(
              title: const Text("Foot Sensors"),
            )),
        backgroundColor: ColorManager.surface,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                phraseContainer(),
                const SizedBox(height: 10),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.75,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: StreamBuilder<Map<String, dynamic>>(
                      stream: feetStreamController.stream.map((snapshot) =>
                          snapshot.map((sensor, sensorVal) => MapEntry(
                              sensor,
                              sensorVal =
                                  ("${sensorVal}N\n${(sensorVal / 9.8).toStringAsFixed(1)}Kg")))),
                      builder: (outerContext,
                              AsyncSnapshot<Map<String, dynamic>> snapshot) =>
                          !snapshot.hasData
                              ? const Center(child: CircularProgressIndicator())
                              : LayoutBuilder(
                                  builder: (innerContext, cons) => Stack(
                                        children: [
                                          foot,
                                          //first row
                                          Positioned(
                                              left: 0.774 * cons.maxWidth,
                                              top: 0.075 * cons.maxHeight,
                                              child: myContainer(
                                                  snapshot.data!["R11"])),
                                          Positioned(
                                              left: 0.61 * cons.maxWidth,
                                              top: 0.045 * cons.maxHeight,
                                              child: myContainer(
                                                  snapshot.data!["R12"])),
                                          Positioned(
                                              left: 0.297 * cons.maxWidth,
                                              top: 0.045 * cons.maxHeight,
                                              child: myContainer(
                                                  snapshot.data!["R13"])),
                                          Positioned(
                                              left: 0.134 * cons.maxWidth,
                                              top: 0.075 * cons.maxHeight,
                                              child: myContainer(
                                                  snapshot.data!["R14"])),
                                          // second row
                                          Positioned(
                                              left: 0.835 * cons.maxWidth,
                                              top: 0.357 * cons.maxHeight,
                                              child: myContainer(
                                                  snapshot.data!["R21"])),
                                          Positioned(
                                              left: 0.699 * cons.maxWidth,
                                              top: 0.329 * cons.maxHeight,
                                              child: myContainer(
                                                  snapshot.data!["R22"])),
                                          Positioned(
                                              left: 0.561 * cons.maxWidth,
                                              top: 0.295 * cons.maxHeight,
                                              child: myContainer(
                                                  snapshot.data!["R23"])),

                                          Positioned(
                                              left: 0.343 * cons.maxWidth,
                                              top: 0.295 * cons.maxHeight,
                                              child: myContainer(
                                                  snapshot.data!["R24"])),
                                          Positioned(
                                              left: 0.21 * cons.maxWidth,
                                              top: 0.329 * cons.maxHeight,
                                              child: myContainer(
                                                  snapshot.data!["R25"])),
                                          Positioned(
                                              left: 0.072 * cons.maxWidth,
                                              top: 0.357 * cons.maxHeight,
                                              child: myContainer(
                                                  snapshot.data!["R26"])),
                                          // third row
                                          Positioned(
                                              left: 0.71 * cons.maxWidth,
                                              top: 0.74 * cons.maxHeight,
                                              child: myContainer(
                                                  snapshot.data!["R31"])),
                                          Positioned(
                                              left: 0.21 * cons.maxWidth,
                                              top: 0.74 * cons.maxHeight,
                                              child: myContainer(
                                                  snapshot.data!["R32"])),
                                        ],
                                      ))),
                )
              ],
            ),
          ),
        ));
  }

  /*
  Image foot = const Image(image: AssetImage(ImageAssetsManager.FootSensors));
  StreamController<List<String>> sensStreamController = StreamController();
  User user = FirebaseAuth.instance.currentUser!;

  late Stream<DocumentSnapshot<Map<String, dynamic>>> feetStream;

  void calcVals() async {
    List<int> sensorsVals = [0,0,0,0,0,0,0,0,0,0,0,0];
    Timer.periodic(const Duration(hours: 4), (_) {
      for (var i = 0; i < sensorsVals.length; ++i) {
        var temp = Random().nextInt(300);
        //sensorsVals[i] = ("${temp}N\n${(temp / 9.8).toStringAsFixed(1)}Kg");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    feetStream = FirebaseFirestore.instance.collection("feetSensors").doc("${user.uid}").snapshots();
    calcVals();
  }

  @override
  Widget build(BuildContext context) {
    var a = MediaQuery.of(context).devicePixelRatio;
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: AppBar(
              title: const Text("Foot Sensors"),
            )),
        backgroundColor: ColorManager.surface,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                phraseContainer(),
                const SizedBox(height: 10),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.75,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: StreamBuilder<Map<String, dynamic>>(
                      stream: feetStream.map((snapshot) => snapshot.data()!.map((sensor, sensorVal) =>
                          MapEntry(sensor, sensorVal= ("${sensorVal}N\n${(sensorVal / 9.8).toStringAsFixed(1)}Kg")))),
                      builder: (outerContext, AsyncSnapshot<Map<String, dynamic>> snapshot) =>
                      !snapshot.hasData
                          ? Center(child: CircularProgressIndicator())
                          : LayoutBuilder(
                              builder: (innerContext, cons) => Stack(
                                    children: [
                                      foot,
                                      //first row
                                      Positioned(
                                          left: 0.774 * cons.maxWidth,
                                          top: 0.075 * cons.maxHeight,
                                          child: myContainer(
                                              snapshot.data!["R11"])),
                                      Positioned(
                                          left: 0.61 * cons.maxWidth,
                                          top: 0.045 * cons.maxHeight,
                                          child: myContainer(
                                              snapshot.data!["R12"])),
                                      Positioned(
                                          left: 0.297 * cons.maxWidth,
                                          top: 0.045 * cons.maxHeight,
                                          child: myContainer(
                                              snapshot.data!["R13"])),
                                      Positioned(
                                          left: 0.134 * cons.maxWidth,
                                          top: 0.075 * cons.maxHeight,
                                          child: myContainer(
                                              snapshot.data!["R14"])),
                                      // second row
                                      Positioned(
                                          left: 0.835 * cons.maxWidth,
                                          top: 0.357 * cons.maxHeight,
                                          child: myContainer(
                                              snapshot.data!["R21"])),
                                      Positioned(
                                          left: 0.699 * cons.maxWidth,
                                          top: 0.329 * cons.maxHeight,
                                          child: myContainer(
                                              snapshot.data!["R22"])),
                                      Positioned(
                                          left: 0.561 * cons.maxWidth,
                                          top: 0.295 * cons.maxHeight,
                                          child: myContainer(
                                              snapshot.data!["R23"])),

                                      Positioned(
                                          left: 0.343 * cons.maxWidth,
                                          top: 0.295 * cons.maxHeight,
                                          child: myContainer(
                                              snapshot.data!["R24"])),
                                      Positioned(
                                          left: 0.21 * cons.maxWidth,
                                          top: 0.329 * cons.maxHeight,
                                          child: myContainer(
                                              snapshot.data!["R25"])),
                                      Positioned(
                                          left: 0.072 * cons.maxWidth,
                                          top: 0.357 * cons.maxHeight,
                                          child: myContainer(
                                              snapshot.data!["R26"])),
                                      // third row
                                      Positioned(
                                          left: 0.71 * cons.maxWidth,
                                          top: 0.74 * cons.maxHeight,
                                          child: myContainer(
                                              snapshot.data!["R31"])),
                                      Positioned(
                                          left: 0.21 * cons.maxWidth,
                                          top: 0.74 * cons.maxHeight,
                                          child: myContainer(
                                              snapshot.data!["R32"])),
                                    ],
                                  ))),
                )
              ],
            ),
          ),
        ));
  }

  */

  Widget phraseContainer() => Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: ColorManager.primaryContainer),
        child: Text(
          "Foot sensors updated in real time measure in Newton and Kilogram.",
          style: TextStyleManager.getRegularStyle(
              size: FontSizeManager.s21, color: ColorManager.primary),
        ),
      );

  Widget myContainer(String text) {
    return Container(
      height: 30,
      child: Center(
          child: Text(text,
              textAlign: TextAlign.center,
              style: TextStyleManager.getItalicStyle(
                  TextStyleManager.getRegularStyle(
                      size: 9, color: ColorManager.secondary)))),
    );
  }
}
