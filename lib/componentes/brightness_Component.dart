import 'package:flutter/material.dart';
import '../models/devices.dart';

class Brightness_Component extends StatefulWidget {
  final LedBrightness brightness;
  const Brightness_Component(this.brightness);

  @override
  State<Brightness_Component> createState() => _Brightness_ComponentState();
}

class _Brightness_ComponentState extends State<Brightness_Component> {
  double _currentSliderValue = 0;

  void _changeValue(BuildContext context, double _value) {
    _value == 0
        ? widget.brightness.state = false
        : widget.brightness.state = true;
    widget.brightness.brightness = _value.toInt();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(children: [
          Text(
            widget.brightness.nameDevice,
            style: Theme.of(context).textTheme.headline6,
          ),
          Slider(
            value: _currentSliderValue,
            max: 100,
            divisions: 100,
            label: _currentSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
                _changeValue(context, value);
              });
            },
          ),
        ]),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [
                widget.brightness.color.withOpacity(0.5),
                widget.brightness.state
                    ? widget.brightness.color
                    : Colors.black87,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
      ),
    );
  }
}
