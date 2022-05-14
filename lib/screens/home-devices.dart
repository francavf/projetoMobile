import 'package:flutter/material.dart';
import 'package:project1/models/devicesList.dart';
import 'package:provider/provider.dart';
import '../componentes/device_Component.dart';

class HomeDevices extends StatelessWidget {
  const HomeDevices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ListDevices>(builder: (context, value, child) {
      return Container(
        child: GridView(
          padding: const EdgeInsets.all(25),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent:
                200, //cada elemento com extenso maxima de 200 pixel
            childAspectRatio: 3 / 2, //proporcao de cada elemento dentro do grid
            crossAxisSpacing: 20, //espacamento no eixo cruzado
            mainAxisSpacing: 20, //espacamento no eixo principal
          ),
          children: ListDevices.DUMMY_DEVICES.map((Device) {
            return Device_Item(Device);
          }).toList(),
        ),
      );
    });
  }
}

/*class HomeDevices extends StatefulWidget {
  const HomeDevices({Key? key}) : super(key: key);

  @override
  State<HomeDevices> createState() => _HomeDevicesState();
}

class _HomeDevicesState extends State<HomeDevices> {
  @override
  Widget build(BuildContext context) {
    final devs = DUMMY_DEVICES.toList();
    print(devs);

    return Material(
      child: ListView.builder(
          itemCount: devs.length,
          itemBuilder: (context, index) {
            return Device_Item(devs[index]);
          }),
    );
  }
}*/
