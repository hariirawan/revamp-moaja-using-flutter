import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mo_aja/provider/_provider.dart';
import 'package:mo_aja/routes.dart';
import 'package:mo_aja/shared/_shared.dart';
import 'package:mo_aja/ui/pages/courier-track/_courier_track.dart';
import 'package:mo_aja/ui/pages/detail-order/_detail_order.dart';
import 'package:mo_aja/ui/pages/home/_home.dart';
import 'package:mo_aja/ui/pages/profile/_profile.dart';
import 'package:mo_aja/ui/pages/shop/_shop.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ListItemProvider>(create: (_) => ListItemProvider()),
    ChangeNotifierProvider<PaymentProvider>(create: (_) => PaymentProvider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
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
    Profile(),
  ];

  void _onTabItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _menuNavigation() => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          // BottomNavigationBarItem(
          //     icon: Padding(
          //         padding: EdgeInsets.symmetric(vertical: 5.0),
          //         child: Image.asset(
          //           _selectedIndex == 0
          //               ? 'assets/icons/icon-navigation/Home.png'
          //               : 'assets/icons/icon-navigation/Home-grey.png',
          //           scale: 4,
          //         )),
          //     title: Text(
          //       "Beranda",
          //       style: TextStyle(
          //           color:
          //               _selectedIndex == 0 ? Themes.green : Color(0xFFBDBDBD)),
          //     )),
          // BottomNavigationBarItem(
          //     icon: Padding(
          //         padding: EdgeInsets.symmetric(vertical: 5.0),
          //         child: Image.asset(
          //           _selectedIndex == 1
          //               ? 'assets/icons/icon-navigation/Document.png'
          //               : 'assets/icons/icon-navigation/Document-grey.png',
          //           scale: 4,
          //         )),
          //     title: Text("Aktifitas",
          //         style: TextStyle(
          //             color: _selectedIndex == 1
          //                 ? Themes.green
          //                 : Color(0xFFBDBDBD)))),
          // BottomNavigationBarItem(
          //     icon: Padding(
          //         padding: EdgeInsets.symmetric(vertical: 5.0),
          //         child: Image.asset(
          //           _selectedIndex == 2
          //               ? 'assets/icons/icon-navigation/Group.png'
          //               : 'assets/icons/icon-navigation/Group-grey.png',
          //           scale: 4,
          //         )),
          //     title: Text("Keranjang",
          //         style: TextStyle(
          //             color: _selectedIndex == 2
          //                 ? Themes.green
          //                 : Color(0xFFBDBDBD)))),
          // BottomNavigationBarItem(
          //     icon: Padding(
          //         padding: EdgeInsets.symmetric(vertical: 5.0),
          //         child: Image.asset(
          //           _selectedIndex == 3
          //               ? 'assets/icons/icon-navigation/Profile.png'
          //               : 'assets/icons/icon-navigation/Profile-grey.png',
          //           scale: 4,
          //         )),
          //     title: Text(
          //       "Profile",
          //       style: TextStyle(
          //           color:
          //               _selectedIndex == 3 ? Themes.green : Color(0xFFBDBDBD)),
          //     )),
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
