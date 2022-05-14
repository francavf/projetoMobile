import 'package:flutter/material.dart';

import 'devices.dart';

//List<Device> devices = new List.empty();
//List<LedBrightness> ledBrightness = new List.empty();
//List<Rgb> ledRgb = new List.empty();

class ListDevices with ChangeNotifier {
  static List<Device> DUMMY_DEVICES = [];

  void addDevices(String name, String mac, Color color) {
    DUMMY_DEVICES.add(Device(
        nameDevice: name,
        macAddress: mac,
        iD: (DUMMY_DEVICES.length + 1),
        color: color));
    notifyListeners();
  }
}
