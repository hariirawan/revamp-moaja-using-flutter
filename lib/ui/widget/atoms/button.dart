part of '../_widget.dart';

class ButtonCircle extends StatelessWidget {
  final Function onTap;
  final double width;
  final double height;
  final double borderRadius;
  final Icon icon;
  final Color colorIcon;

  ButtonCircle(
      {this.onTap,
      this.height = 25,
      this.width = 25,
      this.borderRadius = 30,
      @required this.icon,
      this.colorIcon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (onTap != null) {
            onTap();
          }
        },
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Color(0xFF4C4C4C).withOpacity(0.1),
                  blurRadius: 15,
                  offset: Offset(4, 4)),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Center(child: icon),
        ));
  }
}

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
  final double width;
  final Widget label;
  final double borderRadius;
  final Function onTap;
  final bool outline;

  const Button(
      {Key key,
      @required this.label,
      this.onTap,
      this.outline = false,
      this.btnColor = Colors.green,
      this.paddingH = 14,
      this.paddingV = 12,
      this.width,
      this.borderRadius = 62})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: outline
            ? BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(borderRadius),
                border: Border.all(color: btnColor))
            : BoxDecoration(
                color: btnColor,
                borderRadius: BorderRadius.circular(borderRadius)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(borderRadius),
            onTap: () {
              if (onTap != null) {
                onTap();
              }
            },
            child: Container(
                width: width,
                padding: EdgeInsets.symmetric(
                    horizontal: paddingH, vertical: paddingV),
                child: label),
          ),
        ));
  }
}
