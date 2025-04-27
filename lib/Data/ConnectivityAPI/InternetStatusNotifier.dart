import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum InternetConnStats {
  connected,
  notConnected,
}

StreamProvider<ConnectivityResult> connectivityStream =
    StreamProvider((ref) => Connectivity().onConnectivityChanged);

StateNotifierProvider<InternetStatusNotifier, InternetConnStats>
    internetStatusProvider =
    StateNotifierProvider((ref) => InternetStatusNotifier(ref));


class InternetStatusNotifier extends StateNotifier<InternetConnStats>{
  final connectivityStatus = Connectivity();
  Ref ref;

  InternetStatusNotifier(this.ref) : super(InternetConnStats.notConnected) {
    ref.listen<AsyncValue<ConnectivityResult>>(
        connectivityStream,
        (previous, next) => next.whenData((value) =>
            (value == ConnectivityResult.wifi ||
                    value == ConnectivityResult.mobile)
                ? state = InternetConnStats.connected
                : state = InternetConnStats.notConnected));
  }

  Future<void> init() async {
    switch (await connectivityStatus.checkConnectivity()) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        state = InternetConnStats.connected;
        break;
      default:
        state = InternetConnStats.notConnected;
        break;
    }
  }
}
