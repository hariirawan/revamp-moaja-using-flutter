part of '_widget.dart';

class RatingStars extends StatelessWidget {
  final double voteAverage;
  final double starSize;
  final double fontSize;
  final MainAxisAlignment alignment;
  final Color color;
  final Color fontColor;

  RatingStars(
      {this.voteAverage = 0,
      this.starSize = 10,
      this.fontSize = 12,
      this.fontColor = Colors.white,
      this.alignment = MainAxisAlignment.start,
      this.color = Colors.yellow});

  @override
  Widget build(BuildContext context) {
    int n = (voteAverage / 2).round();

    List<Widget> widgets = List.generate(
        5,
        (index) => Icon(
              index < n ? Icons.star : Icons.star,
              color: index < n ? color : Color(0xFFEDEDED),
              size: starSize,
            ));

    widgets.add(SizedBox(
      width: 3,
    ));
    widgets.add(Text(
      "(10)",
      style: TextStyle(color: fontColor, fontSize: 10),
    ));
    return Row(
      mainAxisAlignment: alignment,
      children: widgets,
    );
  }
}
