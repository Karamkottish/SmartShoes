import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/Views/Splash/Counter.dart';

part 'CounterState.freezed.dart';

enum CounterColors {
  after0(Colors.black),
  after3(Colors.red),
  after6(Colors.green),
  after9(Colors.blue);

  const CounterColors(this.color);

  final Color color;
}

@freezed
class CounterState with _$CounterState {
  const factory CounterState(SplashCounter counter, CounterColors color) =
      _CounterState;
}
