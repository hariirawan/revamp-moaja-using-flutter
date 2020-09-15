part of '_model.dart';

class ModelListItem {
  int id;
  String image;
  String name;
  String desc;
  int price;
  int quantity;
  int discount;
  int total;
  double rate;
  bool promo;
  bool isLike;

  ModelListItem(
      {this.image,
      this.id,
      this.name,
      this.desc,
      this.price,
      this.quantity,
      this.discount,
      this.total,
      this.rate,
      this.isLike = false,
      this.promo = false});
}

List<ModelListItem> itemDummy = [
  ModelListItem(
      id: 1,
      image: 'assets/images/recommended1.png',
      name: "Makaroni",
      desc:
          'Makaroni pedes. enak banget deh, gak bakalan relate pokoknya, siap-siap meninggal..',
      price: 50000,
      total: 50000,
      rate: 3.0,
      promo: true),
  ModelListItem(
      id: 2,
      image: 'assets/images/Rectangle 29.png',
      name: "Buah Segar",
      desc:
          'Makaroni pedes. enak banget deh, gak bakalan relate pokoknya, siap-siap meninggal..',
      price: 50000,
      total: 50000,
      rate: 3.0,
      promo: false),
  ModelListItem(
      id: 3,
      image: 'assets/images/Rectangle 29.png',
      name: "Buah Segar",
      desc:
          'Makaroni pedes. enak banget deh, gak bakalan relate pokoknya, siap-siap meninggal..',
      price: 50000,
      total: 50000,
      promo: true,
      rate: 3.0),
];
