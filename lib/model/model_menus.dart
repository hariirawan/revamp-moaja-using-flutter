part of '_model.dart';

class ModelMenus {
  String icon;
  String name;
  Color color;

  ModelMenus({this.icon, this.name, this.color});
}

List<ModelMenus> menus = [
  ModelMenus(
      icon: 'assets/menu/cemilan.png',
      name: "Makanan\nMinuman",
      color: Color(0xFFEA1D25)),
  ModelMenus(
      icon: 'assets/menu/kebutuhan-harian.png',
      name: "Cemilan",
      color: Color(0xFFFF730B)),
  ModelMenus(
      icon: 'assets/menu/makanan-minuman.png',
      name: "Menu\nSehat",
      color: Color(0xFF72AA29)),
  ModelMenus(
      icon: 'assets/menu/makanan-sehat.png',
      name: "Kebutuhan\nHarian",
      color: Color(0xFF44BDAA)),
];
