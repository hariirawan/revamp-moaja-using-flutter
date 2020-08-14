part of '_model.dart';

class ModelMenus {
  String icon;
  String name;

  ModelMenus({this.icon, this.name});
}

List<ModelMenus> menus = [
  ModelMenus(icon: 'assets/icon-home/belanja.png', name: "MObelanja"),
  ModelMenus(icon: 'assets/icon-home/bayar.png', name: "MObayar"),
  ModelMenus(icon: 'assets/icon-home/gaya.png', name: "MOgaya"),
  ModelMenus(icon: 'assets/icon-home/refresh.png', name: "MOrefresh"),
  ModelMenus(icon: 'assets/icon-home/lainnya.png', name: "Lainnya"),
];
