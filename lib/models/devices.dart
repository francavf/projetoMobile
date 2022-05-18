import 'package:flutter/material.dart';

class Device {
  final String nameDevice;
  final String macAddress;
  final int iD;
  final Color color;
  int type;
  bool state = false;

  Device({
    required this.nameDevice,
    required this.macAddress,
    required this.iD,
    required this.color,
    required this.type,
  });
}

class LedBrightness extends Device {
  LedBrightness(
      String nameDevice, String macAddress, int id, Color color, int type)
      : super(
            nameDevice: nameDevice,
            macAddress: macAddress,
            iD: id,
            color: color,
            type: type);
  int brightness = 0;
}

class Rgb extends LedBrightness {
  int red = 0, green = 0, blue = 0;

  Rgb(String nameDevice, String macAddress, int id, Color color, int type)
      : super(nameDevice, macAddress, id, color, type);
}
