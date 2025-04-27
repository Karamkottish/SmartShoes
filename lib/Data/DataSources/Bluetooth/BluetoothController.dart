import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_shoes/Data/Providers/BluetoothProviders.dart';
import 'package:smart_shoes/Domain/Extensions.dart';

class BluetoothController {

  final container = ProviderContainer();

  Ref ref;
  List<DiscoveredDevice> discoveredDevices = [];

  BluetoothController(this.ref);

  scan(List<Uuid> uuids) {

    discoveredDevices.clear();
    ref
        .watch(bluetoothScannerProvider(uuids))
        .whenData((data) {
          print("inside scan");
          discoveredDevices.addNewDevice(data);
        });
  }
}
