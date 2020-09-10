import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mo_aja/provider/_provider.dart';
import 'package:mo_aja/shared/_shared.dart';
import 'package:mo_aja/ui/pages/courier-track/_courier_track.dart';
import 'package:mo_aja/ui/pages/detail-order/_detail_order.dart';
import 'package:mo_aja/ui/pages/home/_home.dart';
import 'package:mo_aja/ui/pages/shop/_shop.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ListItemProvider>(create: (_) => ListItemProvider()),
    ChangeNotifierProvider<PaymentProvider>(create: (_) => PaymentProvider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  Map<String, WidgetBuilder> get routes {
    return {
      '/': (context) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          child: Layout(),
        );
      },
      '/shop': (context) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          child: Scaffold(body: ShopPage()),
        );
      },
      '/detail-order': (context) {
        return Scaffold(body: DetailOrder());
      },
      '/courier-track': (context) {
        return Scaffold(body: CourierTrack());
      },
    };
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: routes,
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
                        ? 'assets/icons/icon-navigation/Home.png'
                        : 'assets/icons/icon-navigation/Home-grey.png',
                    scale: 4,
                  )),
              title: Text(
                "Beranda",
                style: TextStyle(
                    color:
                        _selectedIndex == 0 ? Themes.green : Color(0xFFBDBDBD)),
              )),
          BottomNavigationBarItem(
              icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: Image.asset(
                    _selectedIndex == 1
                        ? 'assets/icons/icon-navigation/Document.png'
                        : 'assets/icons/icon-navigation/Document-grey.png',
                    scale: 4,
                  )),
              title: Text("Aktifitas",
                  style: TextStyle(
                      color: _selectedIndex == 1
                          ? Themes.green
                          : Color(0xFFBDBDBD)))),
          BottomNavigationBarItem(
              icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: Image.asset(
                    _selectedIndex == 2
                        ? 'assets/icons/icon-navigation/Group.png'
                        : 'assets/icons/icon-navigation/Group-grey.png',
                    scale: 4,
                  )),
              title: Text("Keranjang",
                  style: TextStyle(
                      color: _selectedIndex == 2
                          ? Themes.green
                          : Color(0xFFBDBDBD)))),
          BottomNavigationBarItem(
              icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: Image.asset(
                    _selectedIndex == 3
                        ? 'assets/icons/icon-navigation/Profile.png'
                        : 'assets/icons/icon-navigation/Profile-grey.png',
                    scale: 4,
                  )),
              title: Text(
                "Masuk",
                style: TextStyle(
                    color:
                        _selectedIndex == 3 ? Themes.green : Color(0xFFBDBDBD)),
              )),
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
