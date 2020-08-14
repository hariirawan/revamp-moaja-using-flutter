part of '_widget.dart';

class TitleView extends StatelessWidget {
  TitleView({this.title, this.subtitle = ""});
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    print(width);
    return Row(
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
        Text(
          subtitle,
          style: TextStyle(color: Themes.green, fontSize: width / 30),
        ),
      ],
    );
  }
}
