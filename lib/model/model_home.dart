part of '_model.dart';

class ModelRecomended {
  String image;
  double star;
  String name;

  ModelRecomended({this.image, this.star, this.name});
}

List<ModelRecomended> dummyData = [
  ModelRecomended(
      image: 'assets/images/recomended.png', star: 5, name: "Bakmi JM"),
  ModelRecomended(
      image: 'assets/images/bg_resto.png', star: 5, name: "Bakmi JM"),
  ModelRecomended(
      image: 'assets/images/bg_detail2.png', star: 5, name: "Bakmi JM"),
  ModelRecomended(
      image: 'assets/images/recomended.png', star: 5, name: "Bakmi JM"),
  ModelRecomended(
      image: 'assets/images/recomended.png', star: 5, name: "Bakmi JM"),
];
