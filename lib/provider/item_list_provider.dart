part of '_provider.dart';

class ItemListProvider with ChangeNotifier {
  List<ModelListItem> _data = [
    ModelListItem(
        image: 'assets/images/merchant.png',
        name: "Bakmi Komplit",
        desc:
            "Bakmi komplit yang cocok buat akhir bulan tapi tetep pengen makan kenyang",
        price: 2000,
        discount: 2500,
        quantity: 0),
    ModelListItem(
        image: 'assets/images/merchant.png',
        name: "Bakso Beranak",
        desc:
            "Bakmi komplit yang cocok buat akhir bulan tapi tetep pengen makan kenyang",
        price: 1000,
        discount: 2500,
        quantity: 0),
    ModelListItem(
        image: 'assets/images/merchant.png',
        name: "Mie Ayam",
        desc:
            "Bakmi komplit yang cocok buat akhir bulan tapi tetep pengen makan kenyang",
        price: 2000,
        discount: 2500,
        quantity: 0),
    ModelListItem(
        image: 'assets/images/merchant.png',
        name: "Mie Ayam",
        desc:
            "Bakmi komplit yang cocok buat akhir bulan tapi tetep pengen makan kenyang",
        price: 2000,
        discount: 2500,
        quantity: 0),
  ];

  List<ModelListItem> get dataItemList => _data;

  void incrementQuanty(int index) {
    _data[index].quantity = _data[index].quantity + 1;
    notifyListeners();
  }

  void descrementQuanty(int index) {
    _data[index].quantity = _data[index].quantity - 1;
    notifyListeners();
  }
}
