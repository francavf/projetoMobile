import 'package:flutter/material.dart';

class MyButtonItens extends StatefulWidget {
  const MyButtonItens({Key? key}) : super(key: key);

  @override
  State<MyButtonItens> createState() => _MyButtonItensState();
}

class _MyButtonItensState extends State<MyButtonItens> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['On/Off', 'BrightNess', 'Rgb']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
