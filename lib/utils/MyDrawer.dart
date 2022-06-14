import 'package:flutter/material.dart';
import 'package:project1/models/devices.dart';
import 'package:project1/utils/routes.dart';
import '../models/devicesList.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
          child: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            color: Theme.of(context).colorScheme.primary,
            padding: EdgeInsets.all(40),
            width: 304,
            child: Text(
              "CONFIGURAÇÕES",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).secondaryHeaderColor),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.add,
              size: 26,
            ),
            title: Text(
              'Add_Devices',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(Routes.ADD_DEVICES);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.exit_to_app_sharp,
              size: 26,
            ),
            title: Text(
              'Exit',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              SwitchDevices.SWITCH_DEVICES.clear();
              RgbDevices.RGB_DEVICES.clear();
              BrightnessDevices.BRIGHTNESS_DEVICES.clear();
              Navigator.of(context).pushReplacementNamed(Routes.HOME);
            },
          ),
        ],
      )),
    );
  }
}
