import 'package:flutter/material.dart';
import 'package:inventory_app/page/list_page.dart';
import 'package:inventory_app/page/profile_page.dart';

// Globals
bool _iconBool = true;
IconData _iconLight = Icons.wb_sunny;
IconData _iconDark = Icons.nights_stay;

ThemeData _lightTheme = ThemeData(
  primarySwatch: Colors.deepOrange,
  brightness: Brightness.light,
);
ThemeData _darkTheme = ThemeData(
  primarySwatch: Colors.blue,
  brightness: Brightness.dark,
);

// Globals

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int navigationIndex = 0;
  final screens = [
    const BarCodePage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inventory App',
      theme: _iconBool ? _darkTheme : _lightTheme,
      home: Scaffold(
        appBar: AppBar(
          leading: const Image(
            image: AssetImage('assets/applogo.png'),
            width: 40,
            height: 40,
          ),
          title: const Center(
            child: Text(
              "InventoryApp",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'Javanese Text',
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  _iconBool = !_iconBool;
                });
              },
              icon: Icon(_iconBool ? _iconDark : _iconLight),
            )
          ],
        ),
        body: screens[navigationIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: navigationIndex,
          onTap: (index) => setState(() => navigationIndex = index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'List',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'User',
            ),
          ],
        ),
      ),
    );
  }
}
