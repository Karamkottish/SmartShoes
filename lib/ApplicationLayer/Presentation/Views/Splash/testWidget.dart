import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/Views/Splash/Counter.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/Views/Splash/CounterState.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/_Resources/ColorManager.dart';
import 'package:smart_shoes/Data/Providers/BluetoothProviders.dart';

class TestWidget extends ConsumerWidget {
  const TestWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var s = ref.watch(bluetoothControllerProvider);
    var v = s.scan([]);
    return Scaffold(
        appBar: AppBar(title: const Text("Testing Widget")),
        backgroundColor: ColorManager.surface,
        body: Center(
            child: SingleChildScrollView(
          child: Column(
            children: [Text(v)],
          ),
        )));
  }
}

final strProvider =
    StreamProvider((ref) => Stream.periodic(const Duration(seconds: 2)));

int func() {
  return 0;
}

final counters = Provider((ref) => [s1, s2]);

final s1 = Provider((ref) => const SplashCounter(0, 0));
final s2 = Provider((ref) => const SplashCounter(1, 0));

final counterColorProvider =
    StateNotifierProvider.family<CounterColorModel, Color, CounterState>(
        (ref, arg) {
  return CounterColorModel(arg.color.color);
});

class CounterColorModel extends StateNotifier<Color> {
  CounterColorModel(super.state);
}

final counterProvider =
    StateNotifierProvider.family<CounterViewModel, CounterState, SplashCounter>(
        (ref, SplashCounter val) {
  return CounterViewModel(val);
});

class CounterViewModel extends StateNotifier<CounterState> {
  CounterViewModel(SplashCounter counter)
      : super(CounterState(counter, CounterColors.after0));

  void inc1() {
    if (state.counter.count1 == 11) {
      state = state.copyWith.counter(count1: 0);
    } else {
      state = state.copyWith.counter(count1: state.counter.count1 + 1);
    }
    setColor1();
  }

  void inc2() {
    if (state.counter.count2 == 11) {
      state = state.copyWith.counter(count2: state.counter.count2 + 1);
    } else {
      state = state.copyWith.counter(count2: state.counter.count2 + 1);
    }
    setColor2();
  }

  void setColor1() => state.counter.count1 <= 3
      ? state = state.copyWith(color: CounterColors.after3)
      : state.counter.count1 <= 6
          ? state = state.copyWith(color: CounterColors.after6)
          : state.counter.count1 <= 9
              ? state = state.copyWith(color: CounterColors.after9)
              : null;

  void setColor2() => state.counter.count2 <= 3
      ? state = state.copyWith(color: CounterColors.after3)
      : state.counter.count2 <= 6
          ? state = state.copyWith(color: CounterColors.after6)
          : state.counter.count2 <= 9
              ? state = state.copyWith(color: CounterColors.after9)
              : null;
}
