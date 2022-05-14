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
              height: 60,
              width: 60,
              child: ElevatedButton(
                  onPressed: () {
                    if (ListDevices.cotainInList(nameDevice)) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              "WARNING",
                              style: TextStyle(color: Colors.redAccent),
                            ),
                            content: Text(
                                "Já existe um dispositivo com o nome '$nameDevice'!"),
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
                      context
                          .read<ListDevices>()
                          .addDevices(nameDevice, macAddress, Colors.black54);
                      nameDevice = '';
                      macAddress = '';
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
