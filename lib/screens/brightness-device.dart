import 'package:flutter/material.dart';
import 'package:project1/models/devices.dart';
import 'package:provider/provider.dart';

import '../componentes/brightness_Component.dart';
import '../models/devicesList.dart';

class BrightnessDevicesScreen extends StatelessWidget {
  const BrightnessDevicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BrightnessDevices>(builder: (context, value, child) {
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
          children: BrightnessDevices.BRIGHTNESS_DEVICES.map((LedBrightness) {
            return Brightness_Component(LedBrightness);
          }).toList(),
        ),
      );
    });
  }
}
