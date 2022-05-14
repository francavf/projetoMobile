import 'package:flutter/material.dart';
import '../models/devices.dart';

class Device_Item extends StatelessWidget {
  final Device device;
  const Device_Item(this.device);

  void _selectedDevice(BuildContext context) {
    print(device.nameDevice);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectedDevice(context),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          device.nameDevice,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [
                device.color.withOpacity(0.5),
                device.color,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
      ),
    );
  }
}
