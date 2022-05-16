import 'package:flutter/material.dart';
import '../models/devices.dart';

class Device_Item extends StatefulWidget {
  final Device device;
  const Device_Item(this.device);

  @override
  State<Device_Item> createState() => _Device_ItemState();
}

class _Device_ItemState extends State<Device_Item> {
  bool _value = false;
  void _selectedDevice(BuildContext context) {
    print(widget.device.state);
  }

  void _changeValue(BuildContext context) {
    widget.device.state
        ? widget.device.state = false
        : widget.device.state = true;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectedDevice(context),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(children: [
          Text(
            widget.device.nameDevice,
            style: Theme.of(context).textTheme.headline6,
          ),
          Switch(
            value: widget.device.state,
            onChanged: (value) {
              setState(() {
                _value = value;
                _changeValue(context);
              });
            },
            activeColor: Colors.yellow,
          ),
        ]),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [
                widget.device.color.withOpacity(0.5),
                widget.device.color,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
      ),
    );
  }
}
