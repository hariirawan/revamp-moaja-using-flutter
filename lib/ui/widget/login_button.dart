part of '_widget.dart';

class LoginSosmed extends StatelessWidget {
  final Icon icon;
  LoginSosmed({this.icon});

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
