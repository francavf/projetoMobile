import 'package:project1/screens/brightness-device.dart';
import 'package:project1/screens/rgb-device.dart';
import 'package:project1/utils/MyDrawer.dart';
import '../utils/MyDrawer.dart';
import 'swith-device.dart';
import 'package:flutter/material.dart';
import 'favorites-devices.dart';
import '../utils/routes.dart';
import '../models/devicesList.dart';

class TabsScreen extends StatefulWidget {
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  String namePage = 'SWITCH DEVICES';
  int _indexSelectedScreen = 0;

  List<Widget> _screens = [
    SwitchDevicesScreen(),
    BrightnessDevicesScreen(),
    RgbDevicesScreen()
  ];

  _selectScreen(int index) {
    setState(() {
      _indexSelectedScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    inicializar(context);
    return Scaffold(
      appBar: AppBar(title: Text(namePage), actions: [
        PopupMenuButton(
            icon: Icon(Icons.devices_other),
            itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Text("Switch"),
                    onTap: () {
                      _selectScreen(0);
                      namePage = "SWITCH DEVICES";
                    },
                  ),
                  PopupMenuItem(
                    child: Text("BRIGHTNESS"),
                    onTap: () {
                      _selectScreen(1);
                      namePage = "BRIGHTNESS DEVICES";
                    },
                  ),
                  PopupMenuItem(
                    child: Text("RGB"),
                    onTap: () {
                      _selectScreen(2);
                      namePage = "RGB DEVICES";
                    },
                  ),
                ]),
      ]),
      body: _screens[_indexSelectedScreen],
      drawer: const MyDrawer(),
    );
  }
}
