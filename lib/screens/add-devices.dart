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
                  nameDevice = text;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'MacAddress do dispositivo',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              height: 100,
              width: 100,
              child: ElevatedButton(
                  onPressed: () {
                    context
                        .read<ListDevices>()
                        .addDevices(nameDevice, macAddress, Colors.black54);
                  },
                  child: const Icon(Icons.add)),
            )
          ],
        ),
      ),
    );
  }
}
