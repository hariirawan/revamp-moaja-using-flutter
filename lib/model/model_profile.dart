part of '_model.dart';

class ModelProfile {
  String name;
  String image;
  String url;

  ModelProfile({@required this.name, @required this.image, this.url});
}

List<ModelProfile> menuProfile = [
  ModelProfile(
      url: '/my-review',
      name: "Ulasanku",
      image: 'assets/icons/moaja-profil/ulasanku.png'),
  ModelProfile(
      url: '/review-favorite',
      name: "Ulasan Favorit",
      image: 'assets/icons/moaja-profil/ulasan-favorit.png'),
  ModelProfile(
      url: '/invite',
      name: "Ajak Teman Pakai MOAja",
      image: 'assets/icons/moaja-profil/ajak-teman.png'),
  ModelProfile(
      url: '/privacy-police',
      name: "Kebijakan Privasi",
      image: 'assets/icons/moaja-profil/kebijakan-privasi.png'),
  ModelProfile(
      url: '/terms-of-service',
      name: "Ketentuan Layanan",
      image: 'assets/icons/moaja-profil/ketentuan-layanan.png'),
  ModelProfile(
      url: '/help',
      name: "Bantuan",
      image: 'assets/icons/moaja-profil/bantuan.png'),
  ModelProfile(
      url: '/faq', name: "FAQ", image: 'assets/icons/moaja-profil/faq.png'),
];
