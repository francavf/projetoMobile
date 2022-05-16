import 'package:project1/utils/MyDrawer.dart';
import '../utils/MyDrawer.dart';
import 'home-devices.dart';
import 'package:flutter/material.dart';
import 'favorites-devices.dart';
import '../utils/routes.dart';

class TabsScreen extends StatefulWidget {
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _indexSelectedScreen = 0;

  List<Widget> _screens = [HomeDevices(), FavoritesScreen()];

  _selectScreen(int index) {
    setState(() {
      _indexSelectedScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HOME DEVICES'), actions: [
        PopupMenuButton(
            icon: Icon(Icons.devices_other),
            itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Text("ON/OFF"),
                    onTap: () {},
                  ),
                  PopupMenuItem(
                    child: Text("BRIGHTNESS"),
                    onTap: () {},
                  ),
                  PopupMenuItem(
                    child: Text("RGB"),
                    onTap: () {},
                  ),
                ]),
      ]),
      body: _screens[_indexSelectedScreen],
      drawer: const MyDrawer(),
    );
  }
}


/*PopupMenuButton(
        
          icon: Icon(Icons.accessibility_rounded),
          itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text("lll"),
                  onTap: () {},
                ),
                PopupMenuItem(
                  child: Text("kkk"),
                  onTap: () {},
                ),
              ]),
              
              
              ElevatedButton(
                onPressed: () {
                  context
                      .read<ListDevices>()
                      .addDevices('LL', 'AA', 111, Colors.purpleAccent);
                },
                child: const Icon(Icons.add))
              
              
              
              */