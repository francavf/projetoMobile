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
      drawer: Drawer(
        child: Container(
            child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              color: Theme.of(context).colorScheme.primary,
              padding: EdgeInsets.all(40),
              width: 304,
              child: Text(
                "CONFIGURAÇÕES",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.add_box,
                size: 26,
              ),
              title: Text(
                'Add_Devices',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(Routes.ADD_DEVICES);
              },
            ),
          ],
        )),
      ),
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