import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/devices.dart';

class Color_Setup extends StatefulWidget {
  const Color_Setup({
    Key? key,
  }) : super(key: key);

  @override
  State<Color_Setup> createState() => _Color_SetupState();
}

class _Color_SetupState extends State<Color_Setup> {
  double _r = 0;
  double _g = 0;
  double _b = 0;
  void setColor(BuildContext context) {
    context.watch();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.4,
            alignment: Alignment.center,
            color: Color.fromARGB(255, _r.toInt(), _g.toInt(), _b.toInt()),
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
    ));
  }
}
