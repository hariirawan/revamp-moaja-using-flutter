part of '_model.dart';

class ModelListItem {
  String image;
  String name;
  String desc;
  int price;
  int quantity;
  int discount;
  double rate;
  bool promo;

  ModelListItem(
      {this.image,
      this.name,
      this.desc,
      this.price,
      this.quantity,
      this.discount,
      this.rate,
      this.promo = false});
}

List<ModelListItem> itemDummy = [
  ModelListItem(
      image: 'assets/images/recommended1.png',
      name: "Makaroni",
      desc:
          'Makaroni pedes. enak banget deh, gak bakalan relate pokoknya, siap-siap meninggal..',
      price: 50000,
      rate: 3.0,
      promo: true),
  ModelListItem(
      image: 'assets/images/Rectangle 29.png',
      name: "Buah Segar",
      desc:
          'Makaroni pedes. enak banget deh, gak bakalan relate pokoknya, siap-siap meninggal..',
      price: 50000,
      rate: 3.0,
      promo: false),
  ModelListItem(
      image: 'assets/images/Rectangle 29.png',
      name: "Buah Segar",
      desc:
          'Makaroni pedes. enak banget deh, gak bakalan relate pokoknya, siap-siap meninggal..',
      price: 50000,
      promo: true,
      rate: 3.0),
];
