part of '../_widget.dart';

class Badge extends StatelessWidget {
  final Text label;
  final Color color;
  final double borderRadius;

  Badge(
      {@required this.label,
      this.color = Themes.green,
      this.borderRadius = 50});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 9, vertical: 2),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(borderRadius)),
      child: label,
    );
  }
}
