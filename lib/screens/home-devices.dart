import 'package:flutter/material.dart';

class HomeDevices extends StatefulWidget {
  const HomeDevices({Key? key}) : super(key: key);

  @override
  State<HomeDevices> createState() => _HomeDevicesState();
}

class _HomeDevicesState extends State<HomeDevices> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('HOME-DEVICES'),
        ),
        body: Column(),
      ),
    );
  }
}
