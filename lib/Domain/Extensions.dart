import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

extension BluetoothDevicesExtention on List<DiscoveredDevice>{
  void addNewDevice(DiscoveredDevice device){
    var deviceIndex = indexWhere((element) => element.id == device.id);
    deviceIndex < 0? add(device): this[deviceIndex] = device;
  }
}