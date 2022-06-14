import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1/screens/colorSetup-screen.dart';
import '../models/devices.dart';
import '../utils/routes.dart';

class Rgb_Component extends StatefulWidget {
  final LedRgb rgb;
  const Rgb_Component(this.rgb);

  @override
  State<Rgb_Component> createState() => _Brightness_ComponentState();
}

class _Brightness_ComponentState extends State<Rgb_Component> {
  double _r = 0;
  double _g = 0;
  double _b = 0;
  bool _value = false;

  void _changeValue(BuildContext context) {
    widget.rgb.state ? widget.rgb.state = false : widget.rgb.state = true;
  }

  void _setColor(BuildContext context, double r, double g, double b) {
    widget.rgb.red = r.toInt();
    widget.rgb.green = g.toInt();
    widget.rgb.blue = b.toInt();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await showDialog(
            context: context,
            builder: (BuildContext context) {
              return StatefulBuilder(builder: (context, StateSetter setState) {
                return Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.4,
                        alignment: Alignment.center,
                        color: Color.fromARGB(
                            255, _r.toInt(), _g.toInt(), _b.toInt()),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        height: 50,
                        width: 300,
                        child: Row(
                          children: [
                            Text("R: "),
                            Slider(
                              value: _r,
                              max: 255,
                              divisions: 255,
                              label: _r.round().toString(),
                              onChanged: (double value) {
                                setState(() {
                                  _r = value;
                                  print(value);
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        height: 50,
                        width: 300,
                        child: Row(
                          children: [
                            Text("G: "),
                            Slider(
                              value: _g,
                              max: 255,
                              divisions: 255,
                              label: _g.round().toString(),
                              onChanged: (double value) {
                                setState(() {
                                  _g = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        height: 50,
                        width: 300,
                        child: Row(
                          children: [
                            Text("B: "),
                            Slider(
                              value: _b,
                              max: 255,
                              divisions: 255,
                              label: _b.round().toString(),
                              onChanged: (double value) {
                                setState(() {
                                  _b = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _setColor(context, _r, _g, _b);
                          Navigator.of(context).pop();
                        },
                        child: Text('SetColor'),
                      ),
                    ],
                  ),
                );
              });
            });
      },
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(children: [
          Text(
            widget.rgb.nameDevice,
            style: Theme.of(context).textTheme.headline6,
          ),
          Switch(
            value: widget.rgb.state,
            onChanged: (value) {
              setState(() {
                _value = value;
                _changeValue(context);
              });
            },
            activeColor: Theme.of(context).secondaryHeaderColor,
          ),
        ]),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [
                widget.rgb.color.withOpacity(0.5),
                widget.rgb.state ? widget.rgb.color : Colors.black87,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
      ),
    );
  }
}


/*
Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.4,
                    alignment: Alignment.center,
                    color:
                        Color.fromARGB(255, _r.toInt(), _g.toInt(), _b.toInt()),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    height: 50,
                    width: 300,
                    child: Row(
                      children: [
                        Text("R: "),
                        Slider(
                          value: _r,
                          max: 255,
                          divisions: 255,
                          label: _r.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              _r = value;
                              print(value);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    height: 50,
                    width: 300,
                    child: Row(
                      children: [
                        Text("G: "),
                        Slider(
                          value: _g,
                          max: 255,
                          divisions: 255,
                          label: _g.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              _g = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    height: 50,
                    width: 300,
                    child: Row(
                      children: [
                        Text("B: "),
                        Slider(
                          value: _b,
                          max: 255,
                          divisions: 255,
                          label: _b.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              _b = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('SetColor'),
                  ),
                ],
              ),
            );*/
