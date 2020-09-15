import 'package:flutter/material.dart';
import 'package:mo_aja/main.dart';
import 'package:mo_aja/ui/pages/courier-track/_courier_track.dart';
import 'package:mo_aja/ui/pages/detail-order/_detail_order.dart';
import 'package:mo_aja/ui/pages/profile/_profile.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Layout());
      case '/detail-order':
        return MaterialPageRoute(builder: (_) => DetailOrder());
      case '/courier-track':
        return MaterialPageRoute(builder: (_) => CourierTrack());
      case '/my-review':
        return MaterialPageRoute(builder: (_) => Review());

      case '/profile':
        return MaterialPageRoute(builder: (_) => Profile());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: Text("Error")),
        body: Center(child: Text("Error")),
      );
    });
  }
}
