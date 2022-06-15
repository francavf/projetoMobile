import 'package:flutter/material.dart';

class Device {
  final String nameDevice;
  final int iD;
  final Color color;
  int type;
  bool state = false;

  Device({
    required this.nameDevice,
    required this.iD,
    required this.color,
    required this.type,
  });
}

class LedBrightness {
  int brightness;
  final String nameDevice;
  final int iD;
  final Color color;
  int type = 3;
  bool state = false;

  LedBrightness(
      {required this.brightness,
      required this.nameDevice,
      required this.iD,
      required this.color,
      required int id});
}

class LedRgb {
  int red = 0, green = 0, blue = 0;
  final String nameDevice;
  final int iD;
  final Color color;
  int type = 2;
  bool state = false;

  LedRgb({required this.nameDevice, required this.iD, required this.color});
}
