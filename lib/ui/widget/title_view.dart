part of '_widget.dart';

class TitleView extends StatelessWidget {
  TitleView(
      {this.title,
      this.subtitle = "",
      this.desc = "",
      this.colorSub = Themes.mainColors});
  final String title;
  final String subtitle;
  final String desc;
  final Color colorSub;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    print(width);
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: width / 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 7),
            Text(
              subtitle,
              style: TextStyle(color: colorSub, fontSize: width / 30),
            ),
          ],
        ),
        Text(desc, style: TextStyle(fontSize: 10))
      ],
    ));
  }
}
