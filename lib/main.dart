import 'package:flutter/material.dart';
import 'package:mo_aja/provider/_provider.dart';
import 'package:mo_aja/ui/pages/home/_home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ItemListProvider>(create: (_) => ItemListProvider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.green[300], primarySwatch: Colors.green),
      home: Layout(),
    );
  }
}

class Layout extends StatefulWidget {
  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int _selectedIndex = 0;

  final _layoutPage = [
    HomePage(),
    Acitvity(
      label: "Aktifitas",
    ),
    Acitvity(
      label: "Keranjang",
    ),
    Acitvity(
      label: "Masuk",
    ),
  ];

  void _onTabItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _menuNavigation() => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: Image.asset(
                    _selectedIndex == 0
                        ? 'assets/icon-navigation/Home.png'
                        : 'assets/icon-navigation/Home-grey.png',
                    scale: 4,
                  )),
              title: Text("Beranda")),
          BottomNavigationBarItem(
              icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: Image.asset(
                    _selectedIndex == 1
                        ? 'assets/icon-navigation/Document.png'
                        : 'assets/icon-navigation/Document-grey.png',
                    scale: 4,
                  )),
              title: Text("Aktifitas")),
          BottomNavigationBarItem(
              icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: Image.asset(
                    _selectedIndex == 2
                        ? 'assets/icon-navigation/Group.png'
                        : 'assets/icon-navigation/Group-grey.png',
                    scale: 4,
                  )),
              title: Text("Keranjang")),
          BottomNavigationBarItem(
              icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: Image.asset(
                    _selectedIndex == 3
                        ? 'assets/icon-navigation/Profile.png'
                        : 'assets/icon-navigation/Profile-grey.png',
                    scale: 4,
                  )),
              title: Text("Masuk")),
        ],
        currentIndex: _selectedIndex,
        onTap: _onTabItem,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _layoutPage.elementAt(_selectedIndex),
      bottomNavigationBar: _menuNavigation(),
    );
  }
}

class Acitvity extends StatelessWidget {
  final String label;

  Acitvity({this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text(label)),
    );
  }
}
