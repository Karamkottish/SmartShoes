import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_shoes/Data/DataSources/Bluetooth/BluetoothController.dart';

final bluetoothProvider = Provider((ref) {
  final ble = FlutterReactiveBle();
  ble.initialize();
  return ble;
});

final bluetoothScannerProvider = StreamProvider.family((ref, List<Uuid> uuid) =>
    ref.watch(bluetoothProvider).scanForDevices(withServices: uuid));

final bluetoothControllerProvider = Provider((ref) => BluetoothController(ref));
