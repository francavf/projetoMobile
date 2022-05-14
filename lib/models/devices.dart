import 'package:flutter/material.dart';

class Device {
  final String nameDevice;
  final String macAddress;
  final int iD;
  final Color color;
  final int Type = 1;
  bool state = false;

  Device({
    required this.nameDevice,
    required this.macAddress,
    required this.iD,
    required this.color,
  });
}

class LedBrightness extends Device {
  LedBrightness(String nameDevice, String macAddress, int id, Color color)
      : super(
            nameDevice: nameDevice,
            macAddress: macAddress,
            iD: id,
            color: color);
  int brightness = 0;
}

class Rgb extends LedBrightness {
  int red = 0, green = 0, blue = 0;

  Rgb(String nameDevice, String macAddress, int id, Color color)
      : super(nameDevice, macAddress, id, color);
}
