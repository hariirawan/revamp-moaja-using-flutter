part of '_widget.dart';

class ButtonSosmed extends StatelessWidget {
  final Icon icon;
  ButtonSosmed({this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 19 / 2),
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xFFE4E6E9))),
      child: icon,
    );
  }
}

class Button extends StatelessWidget {
  final Color btnColor;
  final double paddingH;
  final double paddingV;
  final String label;

  const Button(
      {Key key,
      @required this.label,
      this.btnColor = Colors.green,
      this.paddingH = 14,
      this.paddingV = 12})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: btnColor, borderRadius: BorderRadius.circular(62)),
      padding: EdgeInsets.symmetric(horizontal: paddingH, vertical: paddingV),
      child: Text(
        label,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
