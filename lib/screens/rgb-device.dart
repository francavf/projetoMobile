import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../componentes/device_Component.dart';
import '../models/devicesList.dart';

class RgbDevicesScreen extends StatelessWidget {
  const RgbDevicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RgbDevices>(builder: (context, value, child) {
      return Container(
        child: GridView(
          padding: const EdgeInsets.all(18),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent:
                200, //cada elemento com extenso maxima de 200 pixel
            childAspectRatio: 3 / 2, //proporcao de cada elemento dentro do grid
            crossAxisSpacing: 20, //espacamento no eixo cruzado
            mainAxisSpacing: 20, //espacamento no eixo principal
          ),
          children: RgbDevices.RGB_DEVICES.map((Device) {
            return Device_Item(Device);
          }).toList(),
        ),
      );
    });
  }
}
