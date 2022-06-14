import 'package:flutter/material.dart';
import 'package:project1/models/devicesList.dart';
import 'package:provider/provider.dart';
import 'screens/login-screen.dart';
import 'screens/tabs_screens.dart';
import 'utils/routes.dart';
import 'screens/add-devices.dart';
import 'screens/create-account-screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => SwitchDevices()),
      ChangeNotifierProvider(create: (context) => BrightnessDevices()),
      ChangeNotifierProvider(create: (context) => RgbDevices())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        secondaryHeaderColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        Routes.HOME: (context) => LoginPage(),
        Routes.HOME_DEVICES: (context) => TabsScreen(),
        Routes.ADD_DEVICES: ((context) => AddDevice()),
        Routes.CREATE_ACCOUNT: (context) => CreateAccount(),
      },
    );
  }
}
