import 'package:flutter/material.dart';

import 'devices.dart';

//List<Device> devices = new List.empty();
//List<LedBrightness> ledBrightness = new List.empty();
//List<Rgb> ledRgb = new List.empty();

class SwitchDevices with ChangeNotifier {
  static List<Device> SWITCH_DEVICES = [];

  static bool cotainInList(String name) {
    for (var item in SWITCH_DEVICES) {
      if (item.nameDevice == name) {
        return true;
      }
    }
    return false;
  }

  void addSwitch(String name, String mac, BuildContext context) {
    SWITCH_DEVICES.add(Device(
        nameDevice: name,
        macAddress: mac,
        iD: SWITCH_DEVICES.length + 1,
        color: Theme.of(context).primaryColor,
        type: 1));
    notifyListeners();
  }
}

class BrightnessDevices with ChangeNotifier {
  static List<LedBrightness> BRIGHTNESS_DEVICES = [];

  static bool cotainInList(String name) {
    for (var item in BRIGHTNESS_DEVICES) {
      if (item.nameDevice == name) {
        return true;
      }
    }
    return false;
  }

  void addBrightness(String name, String mac, BuildContext context) {
    BRIGHTNESS_DEVICES.add(LedBrightness(
        brightness: 0,
        color: Theme.of(context).primaryColor,
        iD: 2,
        macAddress: mac,
        nameDevice: name,
        id: BRIGHTNESS_DEVICES.length + 1));
    notifyListeners();
  }
}

class RgbDevices with ChangeNotifier {
  static List<LedRgb> RGB_DEVICES = [];

  static bool cotainInList(String name) {
    for (var item in RGB_DEVICES) {
      if (item.nameDevice == name) {
        return true;
      }
    }
    return false;
  }

  void addRgb(String name, String mac, BuildContext context) {
    RGB_DEVICES.add(LedRgb(
        color: Theme.of(context).primaryColor,
        iD: RGB_DEVICES.length + 1,
        macAddress: mac,
        nameDevice: name));
    notifyListeners();
  }
}
