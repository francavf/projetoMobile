import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/devicesList.dart';

class AddDevice extends StatefulWidget {
  const AddDevice({Key? key}) : super(key: key);

  @override
  State<AddDevice> createState() => _AddDeviceState();
}

class _AddDeviceState extends State<AddDevice> {
  String nameDevice = '';
  String macAddress = '';
  String dropDownValue = 'SWITCH';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ADD')),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(5),
              height: 50,
              width: 300,
              child: TextField(
                onChanged: (text) {
                  nameDevice = text;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nome do dispositivo',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              height: 50,
              width: 300,
              child: TextField(
                onChanged: (text) {
                  macAddress = text;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'MacAddress do dispositivo',
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(5),
              height: 50,
              width: 118,
              child: DropdownButton(
                value: dropDownValue,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.black54),
                underline: Container(
                  height: 2,
                  color: Colors.black54,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropDownValue = newValue!;
                  });
                },
                items: <String>['SWITCH', 'BRIGHTNESS', 'RGB']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 60,
              width: 60,
              child: ElevatedButton(
                  onPressed: () {
                    if (SwitchDevices.cotainInList(nameDevice)) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              "WARNING!!!",
                              style: TextStyle(color: Colors.redAccent),
                            ),
                            content: Text(
                                "Já existe um dispositivo com o nome '$nameDevice'."),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("OK"))
                            ],
                          );
                        },
                      );
                    } else {
                      switch (dropDownValue) {
                        case "SWITCH":
                          context
                              .read<SwitchDevices>()
                              .addSwitch(nameDevice, macAddress, context);
                          break;

                        case "BRIGHTNESS":
                          context
                              .read<BrightnessDevices>()
                              .addBrightness(nameDevice, macAddress, context);
                          break;
                        case "RGB":
                          context
                              .read<RgbDevices>()
                              .addRgb(nameDevice, macAddress, context);
                          break;
                        default:
                      }
                    }
                  },
                  child: const Icon(Icons.add)),
            )
          ],
        ),
      ),
    );
  }
}
