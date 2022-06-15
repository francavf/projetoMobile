import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:project1/models/user.dart';
import 'package:provider/provider.dart';

import 'devices.dart';

bool init = false;

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

  void addSwitch(String name, int id, BuildContext context) {
    SWITCH_DEVICES.add(Device(
        nameDevice: name,
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

  void addBrightness(String name, int id, BuildContext context) {
    BRIGHTNESS_DEVICES.add(LedBrightness(
        brightness: 0,
        color: Theme.of(context).primaryColor,
        iD: 2,
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

  void addRgb(String name, int id, BuildContext context) {
    RGB_DEVICES.add(LedRgb(
        color: Theme.of(context).primaryColor,
        iD: RGB_DEVICES.length + 1,
        nameDevice: name));
    notifyListeners();
  }
}

Future<int> createDevice(String name, int tipo, BuildContext context) async {
  var url =
      "http://192.168.1.20:8000/api/devices?name=$name&type=$tipo&red=0&green=0&blue=0&brightness=0";
  String token = User.usuario.token;
  var response = await http.post(Uri.parse(url), headers: {
    'Authorization': 'Bearer $token',
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  });

  if (response.statusCode >= 200 && response.statusCode < 300) {
    alocarDevices(jsonDecode(response.body)['device'], context);
  }

  return response.statusCode;
}

void alocarDevices(var json, BuildContext context) {
  switch (json['type'].toString()) {
    case "1":
      context
          .read<SwitchDevices>()
          .addSwitch(json['name'], json['id'], context);
      break;
    case "3":
      context
          .read<BrightnessDevices>()
          .addBrightness(json['name'], json['id'], context);
      break;
    case "2":
      context.read<RgbDevices>().addRgb(json['name'], json['id'], context);
      break;
  }
}

void inicializar(BuildContext context) async {
  if (!init) {
    String token = User.usuario.token;
    var url = "http://192.168.1.20:8000/api/devices";
    var response = await http.get(Uri.parse(url), headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    });

    var parsedJson = json.decode(response.body);
    for (var item in parsedJson) {
      alocarDevices(item, context);
    }
    init = true;
  }
}
