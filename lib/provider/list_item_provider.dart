part of '_provider.dart';

class ListItemProvider with ChangeNotifier {
  List<ModelListItem> _data = [
    ModelListItem(
        id: 1,
        image: 'assets/images/merchant.png',
        name: "Bakmi Komplit",
        desc:
            "Bakmi komplit yang cocok buat akhir bulan tapi tetep pengen makan kenyang",
        price: 10000,
        discount: 2500,
        total: 2500,
        isLike: false,
        quantity: 0),
    ModelListItem(
        id: 2,
        image: 'assets/images/merchant.png',
        name: "Bakso Beranak",
        desc:
            "Bakmi komplit yang cocok buat akhir bulan tapi tetep pengen makan kenyang",
        price: 2000,
        total: 4000,
        discount: 2500,
        isLike: false,
        quantity: 0),
    ModelListItem(
        id: 3,
        image: 'assets/images/merchant.png',
        name: "Mie Ayam",
        desc:
            "Bakmi komplit yang cocok buat akhir bulan tapi tetep pengen makan kenyang",
        price: 3000,
        total: 5000,
        discount: 2500,
        isLike: false,
        quantity: 0),
    ModelListItem(
        id: 4,
        image: 'assets/images/merchant.png',
        name: "Mie Ayam",
        desc:
            "Bakmi komplit yang cocok buat akhir bulan tapi tetep pengen makan kenyang",
        price: 4000,
        total: 2000,
        discount: 2500,
        isLike: false,
        quantity: 0),
    ModelListItem(
        id: 5,
        image: 'assets/images/merchant.png',
        name: "Mie Ayam",
        desc:
            "Bakmi komplit yang cocok buat akhir bulan tapi tetep pengen makan kenyang",
        price: 5000,
        discount: 2500,
        total: 2500,
        isLike: false,
        quantity: 0),
    ModelListItem(
        id: 6,
        image: 'assets/images/merchant.png',
        name: "Mie Ayam",
        desc:
            "Bakmi komplit yang cocok buat akhir bulan tapi tetep pengen makan kenyang",
        price: 6000,
        discount: 2500,
        total: 2000,
        isLike: false,
        quantity: 0),
    ModelListItem(
        id: 7,
        image: 'assets/images/merchant.png',
        name: "Mie Ayam",
        desc:
            "Bakmi komplit yang cocok buat akhir bulan tapi tetep pengen makan kenyang",
        price: 18000,
        total: 8000,
        discount: 2500,
        isLike: false,
        quantity: 0),
  ];

  List<ModelListItem> get dataItemList => _data;
  List<ModelListItem> get itemCheckout =>
      _data.where((element) => element.quantity > 0).toList();

  void incrementQuanty(int index) {
    _data = _data.map((e) {
      if (e.id == index) {
        e.quantity = e.quantity + 1;
        e.total = e.price * e.quantity;
        return e;
      } else {
        return e;
      }
    }).toList();
    notifyListeners();
  }

  void descrementQuanty(int index) {
    _data = _data.map((e) {
      if (e.id == index) {
        e.quantity = e.quantity - 1;
        e.total = e.price * e.quantity;
        return e;
      } else {
        return e;
      }
    }).toList();

    notifyListeners();
  }

  void onLikes(int index) {
    _data[index].isLike = !_data[index].isLike;
    notifyListeners();
  }
}
