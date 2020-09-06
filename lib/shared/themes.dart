part of '_shared.dart';

class Themes {
  Themes._();
  static const double marginDefault = 20;
  static const Color mainColors = Color(0xFF50BD58);
  static const Color red = Color(0xFFC41622);
  static const Color redAccent = Color(0xFFFFF5F6);
  static const Color green = Color(0xFF30BB09);

  static TextStyle fontBold = GoogleFonts.montserrat().copyWith(
    color: Color(0xFF4C4C4C),
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );
  static TextStyle fontNormal = GoogleFonts.openSans().copyWith(
    color: Color(0xFF4D4D4D),
    fontSize: 10,
  );

  static TextStyle fontLogo = GoogleFonts.quicksand().copyWith(
    color: Color(0xFF4D4D4D),
    fontSize: 10,
  );
}
